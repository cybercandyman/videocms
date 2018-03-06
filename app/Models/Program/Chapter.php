<?php
require_once MODULE_DIRECTORY . '/tools/models/semantic.php';
class Model_Program_Chapter extends Model_Api {

	public function __construct() {

		parent::__construct ();
	}

	public function timecodeInSec() {

		try {
			$timecode = $this->timecode;
			$parts = explode ( ":", $timecode );
			$tmp = 0;
			for($i = 0; $i < sizeof ( $parts ); $i ++) {
				switch ($i) {
					case 0 :
						$tmp += $parts [$i] * 3600;
						break;
					case 1 :
						$tmp += $parts [$i] * 60;
						break;
					case 2 :
						$tmp += $parts [$i];
						break;
				}
			}
			return floor ( $tmp );
		}
		catch ( Exception $error ) {
		}
	}

	public function getCleanTimeCode() {

		$tc = $this->timecodeInSec ();
		return str_ireplace ( ".", ":", ZN_Utils_Timecode::tcToString ( ZN_Utils_Timecode::secToTc ( $tc ) ) );
	}

	/**
	 * Return a chapter's field value according to his code
	 * return false if $code_of_field not found
	 * @param null|string $code_of_field
	 */
	public function getField($code_of_field) {

		if (isset ( $this->_data ["details"] ) && array_key_exists ( $code_of_field, $this->_data ["details"] )) {
			return $this->_data ["details"] [$code_of_field] ["value"];
		}
		return null;
	}
	
	private $semantics = null;

	/**
	 * La récupération de la sémantique se fait au niveau du programme et non au niveau des chapitres pour une question de récursivité et de performance
	 * Return all uri of object semantics associated to the chapter
	 */
	public function getSemantics() {

		if (isset ( $this->_data ["semantics"] ))
			return $this->_data ["semantics"];
		else return null;
		
		if ($this->semantics === null && ZN_Utils::get ( @$this->_config ["semantic_enable"], false )) {
			$idCache = "chaptersemantic_" . $this->_data ['id'];
			$cacheTags = array ("chapter", "semantic" );
			//$this->_logger->log($idCache,Zend_Log::ALERT);
			if (! ($data = $this->_cache->load ( $idCache ))) {
				//$this->_logger->log("NOT IN CACHE, Requesting ...",Zend_Log::ALERT);
				$semantic = new semantic ();
				$tmp = Zend_Json::decode ( $semantic->getChapterSemantics ( $this->_data ['id'], 'JSON' ) );
				$data = $this->semantics = @$tmp ["results"] ["bindings"];
				$this->_cache->save ( $data, $idCache, $cacheTags );
			
		//$this->_logger->log("SAVE IN CACHE WITH $idCache",Zend_Log::ALERT);			  	 
			}
			return $data;
		}
		return $this->semantics;
	}

}