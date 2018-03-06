<?php
require_once MODULE_DIRECTORY . "/sadmin/models/fields.php";
class Model_Field extends Model_Api
{
	public $lang ;
	
    public function __construct ($code, $lang = null)
    {
        parent::__construct();
        try {
            if ($lang == null) {
               $this->lang = $lang = $this->_session->locale;
            }else $this->lang = $lang;
           
            $strSQL = "SELECT f.idfield,
                          CASE WHEN tt.value is null THEN f.title
                          ELSE tt.value
                          END  as title
                          ,f.type,f.table_ref,f.parent,f.mask,f.default_value,f.code
		              FROM 
		                  programs_fields f
		              LEFT OUTER JOIN 
		                  translations tt ON tt.ref_num = f.idfield 
		                  AND tt.lang = '" . addslashes($lang) . "' 
		                  AND tt.column_title = 'title' 
		                  AND tt.table_name = 'programs_fields' 
		              WHERE 
		                  f.code = ? 		                  
              ";
            $statement = $this->_db->prepare($strSQL);
            $statement->execute(array($code));
            $this->set_data($statement->fetch());
            $this->view->setScriptPath(MODULE_DIRECTORY . 'api/views/scripts/model');
        } catch (ZN_Exception $error) {}
    }
    /**
     *  Return HTML code for SELECT or SELECT_MULTI
     *  In other case, use an input text fulltext in order to search fulltext on all fields
     */
    public function getHtml ()
    {
        $this->view->field = $this->get_data();
        $this->view->lang = $this->lang;
        $xml = $this->view->render("field.phtml");
        return $xml;
    }
    /**
     * Return an object Model_Field by an input form id ex: TEXT_12 
     * @param unknown_type $idform
     */
    static public function getFieldFromIdForm ($idform)
    {
        try {
            $strSQL = "SELECT programs_fields.code
            	FROM programs_fields_group_fields pfgf 
            	LEFT OUTER JOIN programs_fields ON pfgf.idfield = programs_fields.idfield
            	WHERE pfgf.idfgroup = ?";
            $idfieldgroup = substr($idform, (strpos($idform, "_") + 1), strlen($idform));
            if (is_numeric($idfieldgroup)) {
                $model = new Model_Api();
                $result = $model->_db->fetchOne($strSQL, array($idfieldgroup));
                if ($result ) {
                    return new Model_Field($result);
                }else return null;
            }else return null;
        } catch (ZN_Exception $error) {}
    }
}