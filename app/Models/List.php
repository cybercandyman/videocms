<?php
require_once MODULE_DIRECTORY . '/sadmin/models/publication.php';
require_once MODULE_DIRECTORY . '/prod/models/programs_group.php';
require_once MODULE_DIRECTORY . '/prod/models/programs_group_parameters.php';
class Model_List extends Model_Api {
	public $countItems;
	public $strSQL;
	private $select = array ();
	private $fromList = array ();
	private $whereList = array ();
	private $orderList = array ();
	private $idpublication;
	private $publicationkey;
	private $idviewWanted;
	private $idviewDefault;
	public $countCondition = 0;
	private $operatorList = array ("=", "!=", "<", ">", "<=", ">=" );

	public function toJson() {

		$this->view->videolist = $this;
		$this->view->publicationkey = $this->publicationkey;
		$xml = $this->view->render ( "videolist.phtml" );
		return  Zend_Json::fromXml($xml, true);
	}
	/**
	 * 
	 * @var Zend_Paginator
	 */
	public $_programs = array ();

	/**
	 * 
	 * More params to filter and order the list
	 * In order to be include, parameters must have this format :
	 * Filter_[Code of field] 
	 * Filter_[Code of field]_operator
	 * Order_[Code of field] = ASC|DESC
	 * Fulltext concern all fields, you must only give a fulltext parameter
	 * @param unknown_type $publicationkey
	 * @param unknown_type $numItem
	 * @param unknown_type $page
	 * @param unknown_type $viewcode
	 */
	public function __construct() {

		parent::__construct ();
		if (func_num_args () > 0) {
			return call_user_func_array ( array ($this, "__constructv1" ), func_get_args () );
		}
	}

	public static function factory($params = array()) {

		$defaultParams = array ("prodExport" => false, "identifiant" => null, "idplaylist" => 0, "viewcode" => null, "lang" => null, "publicationkey" => null );
		$params = array_merge ( $defaultParams, $params );
	}

	/**
	 * More params to filter and order the list
	 * In order to be include, parameters must have this format :
	 * Filter_[Code of field] 
	 * Filter_[Code of field]_operator
	 * Order_[Code of field] = ASC|DESC
	 * Fulltext concern all fields, you must only give a fulltext parameter
	 * @param unknown_type $publicationkey
	 * @param unknown_type $numItem
	 * @param unknown_type $page
	 * @param unknown_type $viewcode
	 */
	public function __constructv1($publicationkey, $numItem = 10, $page = 0, $viewcode = "default") {

		$this->idpublication = $this->getIdPublication ( $publicationkey );
		$this->publicationkey =  $publicationkey ;
		$this->idviewWanted = $this->getIdView ( $this->idpublication, $viewcode );
		$this->idviewDefault = $this->getIdView ( $this->idpublication, "default" );
		$lang = Zend_Controller_Front::getInstance ()->getRequest ()->getParam ( "lang", "" );
		$realRequestedCodeView = Zend_Controller_Front::getInstance ()->getRequest ()->getParam ( "viewcode", "" );
		$publication = new publication ();
		// Si on a pas envoyé de paramétre viewcode a la fonction et qu'il existe une précision sur la langue on cherche un viewcode correspondant
		if ($lang != "" && $realRequestedCodeView == "") {
			$viewstmp = $publication->getViews ( $this->idpublication );
			foreach ( $viewstmp as $tmpView ) {
				if ($tmpView ["locale"] == $lang) {
					$this->idviewWanted = $this->getIdView ( $this->idpublication, $tmpView ["viewcode"] );
				}
			}
		}
		$this->analyseParameters ();
		$this->strSQL = "SELECT DISTINCT val1.idprog,val1.keyprog %s FROM %s programs_publications pp 
        WHERE pp.idpublication = %s AND pp.idprog = val1.idprog_programs_of  AND  pp.idpublication = val1.idpublication
        %s
        %s";
		$tmp = "";
		foreach ( $this->fromList as $from ) {
			$tmp .= $from . ",";
		}
		$fromList = $tmp;
		$whereList = $orderList = $select = "";
		if (sizeof ( $this->select ) > 0) {
			foreach ( $this->select as $fieldToSelect )
				$select .= "," . $fieldToSelect;
		}
		if (sizeof ( $this->orderList ) > 0) {
			foreach ( $this->orderList as $order ) {
				$orderList .= $orderList == "" ? " ORDER BY " : ",";
				$orderList .= $order;
			}
		}
		// Limité à ceux publié par le compte de publication et ceux qui ne sont pas supprimés en prod
		$this->whereList [] = " AND val1.idprog_programs_of IN (SELECT idprog FROM programs_publications WHERE idpublication=" . $this->idpublication . " AND state='published') AND
        val1.programstate = 'ACTIVATED'";
		if (sizeof ( $this->whereList ) > 0) {
			foreach ( $this->whereList as $where ) {
				$whereList .= "  " . $where;
			}
		}
		$this->strSQL = sprintf ( $this->strSQL, $select, $fromList, $this->idpublication, $whereList, $orderList );
		try {
			$statement = $this->_db->prepare ( $this->strSQL );
			$statement->execute ();
			$items = $statement->fetchAll ();
		}
		catch ( Exception $error ) {
			new ZN_Exception ( $error );
		}
		$paginator = new Zend_Paginator ( new Zend_Paginator_Adapter_Array ( $items ) );
		if ($numItem == - 1)
			$paginator->setItemCountPerPage ( sizeof ( $items ) );
		else $paginator->setItemCountPerPage ( $numItem );
		$paginator->setCurrentPageNumber ( $page );
		foreach ( $paginator as &$item ) {
			$item = new Model_Program ( $item ["keyprog"], $viewcode, $publicationkey );
		}
		$this->countItems = $paginator->getTotalItemCount ();
		$this->_programs = $paginator;
	}

	public function setDefault() {

		$params = Zend_Controller_Front::getInstance ()->getRequest ()->getParams ();
		$order = false;
		foreach ( $params as $key => $value ) {
			$founded = false;
			$parts = explode ( "_", $key );
			if (sizeof ( $parts ) == 2) {
				switch (strtolower ( $parts [0] )) {
					case "order" :
						$order = true;
						break;
				}
			}
		}
		if (! $order) {
			Zend_Controller_Front::getInstance ()->getRequest ()->setParam ( "ORDER_idext", "desc" );
			Zend_Controller_Front::getInstance ()->getRequest ()->setParam ( "ORDER_title", "desc" );
		}
	}

	/**
	 * Check optional parameters to filter and order the list
	 * ORDER_CODE = ASC|DESC
	 * FILTER_CODE = .*
	 * FILTER_CODE_OPE = <|<=|=|>=|>
	 */
	public function analyseParameters() {

		$this->setDefault ();
		$params = Zend_Controller_Front::getInstance ()->getRequest ()->getParams ();
		$pg = new programs_group ();
		$pr = new program ();
		foreach ( $params as $key => $value ) {
			$founded = false;
			$parts = explode ( "_", $key );
			if (sizeof ( $parts ) == 2) {
				// CHECK parts[1] if exist
				switch (strtolower ( $parts [0] )) {
					case "filter" :
						$this->addFilter ( $parts [1], $value, (array_key_exists ( $key . "_ope", $params ) ? $params [$key . "_ope"] : "="), (array_key_exists ( $key . "_link", $params ) ? $params [$key . "_link"] : "AND") );
						break;
					case "order" :
						if (strtolower ( $value ) == "asc" || strtolower ( $value ) == "desc") {
							$this->fromList [] = $this->addFrom ( $this->idpublication, ++ $this->countCondition, $this->idviewDefault, $this->idviewWanted, $parts [1] );
							$this->orderList [] = "val" . $this->countCondition . ".finalVal" . " " . $value . "  NULLS LAST";
							$this->select [] = "val" . $this->countCondition . ".finalVal";
						}
						break;
					default :
						break;
				}
			}
			if ($key == "fulltext") {
				$this->addFilter ( $key, $value );
			}
		}
		if (sizeof ( $this->fromList ) == 0)
			$this->fromList [] = $this->addFrom ( $this->idpublication, ++ $this->countCondition, $this->idviewDefault, $this->idviewWanted, 'title' );
		if (sizeof ( $this->fromList ) >= 2) {
			for($i = 0; $i < sizeof ( $this->fromList ); $i ++) {
				$this->whereList [] = " AND val1.idprog = " . "val" . ($i + 1) . ".idprog";
			}
		}
	}

	public function addFilter($key, $value, $operator = "=", $link = "AND") {

		if (! in_array ( $operator, $this->operatorList ))
			return false;
		if (is_array ( $value )) {
			$tmp = "";
			foreach ( $value as $val ) {
				
				$val = trim ( addslashes ( strip_tags ( $val ) ) );
				if($val == "") continue;
				$model = new program ();
				$fieldInfo = $model->getField ( $key );
				$tmp .= $tmp != "" ? " OR " : "";
				if ($key != "fulltext") {
					if ($fieldInfo ["type"] == "DATE") {
						$tmp .= " val1.idprog IN(SELECT idprog FROM programsview WHERE code='" . $key . "' AND substring(value from 1 for char_length('" . $val . "'))" . $operator . "'" . $val . "' )";
					}
					else {
						$tmp .= " val1.idprog IN(SELECT idprog FROM programsview WHERE code='" . $key . "' AND value " . $operator . "'" . $val . "' )";
					}
				}
				else {
					if ($val != "") {
						//$this->whereList[] = " $link val1.idprog in (SELECT idprog FROM programsview WHERE value ~* '.*$value.*' )";
						$tmp .= " val1.idprog in (SELECT idprog FROM programsview WHERE  textsearchable_index_col @@ plainto_tsquery('" . $val . "') )";
					}
				}
			}
			if (strtoupper ( $link ) != "AND" && strtoupper ( $link ) != "OR")
				$link = "AND";
			$this->whereList [] = " $link ($tmp) ";
		}
		else {
			$value = trim ( addslashes ( strip_tags ( $value ) ) );
			if($value == "") return false;
			$model = new program ();
			$fieldInfo = $model->getField ( $key );
			if (strtoupper ( $link ) != "AND" && strtoupper ( $link ) != "OR")
				$link = "AND";
			if ($key != "fulltext") {
				if ($fieldInfo ["type"] == "DATE") {
					$this->whereList [] = " $link val1.idprog IN(SELECT idprog FROM programsview WHERE code='" . $key . "' AND substring(value from 1 for char_length('" . $value . "'))" . $operator . "'" . $value . "' )";
				}
				else {
					$this->whereList [] = " $link val1.idprog IN(SELECT idprog FROM programsview WHERE code='" . $key . "' AND value " . $operator . "'" . $value . "' )";
				}
			}
			else {
				if ($value != "") {
					//$this->whereList[] = " $link val1.idprog in (SELECT idprog FROM programsview WHERE value ~* '.*$value.*' )";
					$this->whereList [] = " $link val1.idprog in (SELECT idprog FROM programsview WHERE  textsearchable_index_col @@ plainto_tsquery('" . $value . "') )";
				}
			}
		}
	}

	/**
	 * Add a from part to order a list according to a specific field ($code) and the existing translations
	 * @param unknown_type $idpublication
	 * @param unknown_type $instance
	 * @param unknown_type $defaultIdView
	 * @param unknown_type $wantedIdView
	 * @param unknown_type $code
	 */
	private function addFrom($idpublication, $instance, $defaultIdView, $wantedIdView, $code) {

		$from = "(SELECT DISTINCT programsview.*, CASE WHEN view2.value is null THEN programsview.value
                    	ELSE view2.value
                    	END  as finalVal
                    	FROM programsview 
                    	LEFT OUTER JOIN programsview as view2 ON programsview.idprog = view2.idprog AND programsview.idfield  = view2.idfield AND view2.idview = $wantedIdView
                    	WHERE programsview.code='$code' AND programsview.idpublication=$idpublication 
                    	AND (programsview.idview = $defaultIdView OR programsview.idview IS NULL)
                    ORDER BY finalVal ASC) 
                    AS val$instance";
		return $from;
	}

	/**
	 * Return collection of Model_Program
	 * @return Zend_Paginator of Model_Program
	 */
	public function getPrograms() {

		return $this->_programs;
	}

	/**
	 * 
	 * @return Zend_Paginator
	 */
	public function getPaginator() {

		return $this->_programs;
	}
}

/**
SELECT DISTINCT *
    FROM  
    (SELECT DISTINCT VIEW1.*, CASE WHEN view2.value is null THEN VIEW1.value
	ELSE view2.value
	END  as finalVal
	FROM VIEW1 
	LEFT OUTER JOIN VIEW1 as view2 ON VIEW1.idprog = view2.idprog AND VIEW1.idfield  = view2.idfield AND view2.idview = 10
	WHERE VIEW1.code='title' AND VIEW1.idpublication=11 AND VIEW1.idview = 4
ORDER BY finalVal ASC) 
AS val1,
    (SELECT DISTINCT VIEW1.*, CASE WHEN view2.value is null THEN VIEW1.value
	ELSE view2.value
	END  as finalVal
	FROM VIEW1 
	LEFT OUTER JOIN VIEW1 as view2 ON VIEW1.idprog = view2.idprog AND VIEW1.idfield  = view2.idfield AND view2.idview = 10
	WHERE VIEW1.code='date' AND VIEW1.idpublication=11 AND VIEW1.idview = 4
ORDER BY finalVal ASC) 
AS val2,
    programs_publications pp
    WHERE pp.idpublication = 11 AND pp.idprog = val1.idprog_programs_of  AND  pp.idpublication = val1.idpublication
AND val1.idprog = val2.idprog	
ORDER BY val2.finalVal DESC,val1.finalVal ASC
 */
/*
SELECT VIEW1.idprog,
CASE WHEN view2.value is null THEN VIEW1.value
ELSE view2.value
END  as finalVal
FROM VIEW1 
LEFT OUTER JOIN VIEW1 as view2 ON VIEW1.idprog = view2.idprog AND VIEW1.idfield  = view2.idfield AND view2.idview = 10
WHERE VIEW1.code='title' AND VIEW1.idpublication=11 AND VIEW1.idview = 4
ORDER BY finalVal desc
*/
 