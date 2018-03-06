<?php
require_once MODULE_DIRECTORY . '/prod/models/program.php';
require_once MODULE_DIRECTORY . '/sadmin/models/publication.php';
class Model_Program extends Model_Api {
	public $publicationkey;
	public $viewcode;
	public $lang;
	public $idview;
	public $locale;
	public $keyprog;
	public $idpublication;
	private $program;
	private $idplaylist;
	private $dataview;
	private $prodExport;
	private $_programExtractFrom = null;
	public $_array;
	public $params;
	/**
	 * 
	 * @var Model_Video
	 */
	public $video;

	/**     
	 * @deprecated use factory instead
	 * The last param is only used for export production program. In other way, don't use this param cause u only need data from a publication view
	 * @param $identifiant
	 * @param $viewcode
	 * @param $publicationkey
	 * @param $idplaylist
	 * @param $prodExport
	 */
	public function __construct() {

		parent::__construct ();
		$this->view->setScriptPath ( MODULE_DIRECTORY . 'api/views/scripts/model' );
		if (func_num_args () > 0) {
			return call_user_func_array ( array ($this, "__constructv1" ), func_get_args () );
		}
	}

	public function toJson() {

		$this->view->publicationkey = $this->publicationkey;
		$this->view->program = $this;
		//Zend_Debug::dump($program);exit(0);
		$xml = $this->view->render ( "program.phtml" );
		return Zend_Json::fromXml ( $xml, true );
	}

	/**
	 * 
	 * Enter description here ...
	 * @param unknown_type $params
	 * @return Model_Program
	 * @throws Exception
	 */
	public static function factory($params = array()) {

		$defaultParams = array ("prodExport" => false, "identifiant" => null, "idplaylist" => 0, "viewcode" => null, "lang" => null, "publicationkey" => null, "directProdProgram" => false );
		$params = array_merge ( $defaultParams, $params );
		$objProgram = new Model_Program ();
		$objProgram->params = $params;
		if ($params ["keyprog"])
			$objProgram->keyprog = $params ["keyprog"];
		else return false;
		$pr = new program ();
		$publication = new publication ();
		$objProgram->program = $program = $pr->getProgram ( $objProgram->keyprog );
		if (sizeof ( $program ) == 0 || $program === false)
			throw new Exception ( "Program not found" );
		if ($params ["publicationkey"] === null && ! $params ["prodExport"]) {
			$idpubTmp = $objProgram->program [0] ["idpublication"];
			$pubTmp = $publication->getPublication ( $idpubTmp );
			if (sizeof ( $pubTmp ) > 0)
				$params ["publicationkey"] = $pubTmp [0] ["key"];
		}
		$objProgram->prodExport = $params ["prodExport"];
		$objProgram->publicationkey = $params ["publicationkey"];
		$pub = $publication->getPublicationByKey ( $params ["publicationkey"] );
		if (! $pub && ! $params ["prodExport"]) {
			throw new Exception ( "Publication not found" );
		}
		$view = $objProgram->dataview = $publication->getView ( $pub ["idpublication"], ZN_Utils::get ( $params ["viewcode"], "default" ) );
		// Déduire la langue des libellés depuis le codeview
		if ($params ["lang"] === null && $params ["viewcode"] !== null) {
			$viewtmp = $publication->getView ( $pub ["idpublication"], $params ["viewcode"] );
			if (sizeof ( $viewtmp ) > 0) {
				$params ["lang"] = $viewtmp ["locale"];
			}
		}
		elseif ($params ["lang"] === null && $params ["viewcode"] === null) {
			$viewtmp = $publication->getView ( $pub ["idpublication"], "default" );
			if (sizeof ( $viewtmp ) > 0) {
				$params ["lang"] = $viewtmp ["locale"];
			}
		}
		elseif ($params ["lang"] !== null && $params ["viewcode"] === null) {
			$viewstmp = $publication->getViews ( $pub ["idpublication"] );
			foreach ( $viewstmp as $tmpView ) {
				if ($tmpView ["locale"] == $params ['lang']) {
					$view = $objProgram->dataview = $publication->getView ( $pub ["idpublication"], $tmpView ["viewcode"] );
				}
			}
		}
		$objProgram->idpublication = $pub ["idpublication"];
		$objProgram->viewcode = $view ["viewcode"];
		$objProgram->idview = $view ["idview"];
		$objProgram->locale = $params ["lang"];
		$objProgram->lang = $params ["lang"];
		if (sizeof ( $program ) > 0) {
			$details = $program [0] ["details"] = $objProgram->_data ["details"] = null;
			$chapters = $program [0] ["chapters"] = $objProgram->_data ["chapters"] = null;
			$pictures = $program [0] ["pictures"] = $objProgram->_data ["pictures"] = null;
			$videos = $program [0] ["videos"] = $objProgram->_data ["videos"] = null;
			$serie = $program [0] ["serie"] = array ();
			$language = $program [0] ["language"] = array ();
			$objProgram->_data = $program [0];
		
		// return $program[0];
		}
		return $objProgram;
	}

	private function __constructv1($identifiant = null, $viewcode = "default", $publicationkey = null, $idplaylist = null, $prodExport = false, $directProdProgram = false) {

		$this->keyprog = $identifiant;
		if ($identifiant === null)
			return $this;
		$pr = new program ();
		$this->program = $program = $pr->getProgram ( $identifiant );
		$idplaylist = $this->idplaylist = $idplaylist === null ? 0 : $idplaylist;
		$publication = new publication ();
		if (sizeof ( $program ) == 0 || $program === false)
			throw new Exception ( "Program not found" );
		if ($publicationkey === null && ! $prodExport) {
			$idpubTmp = $program [0] ["idpublication"];
			$pubTmp = $publication->getPublication ( $idpubTmp );
			if (sizeof ( $pubTmp ) > 0)
				$publicationkey = $pubTmp [0] ["key"];
		}
		$this->prodExport = $prodExport;
		$this->publicationkey = $publicationkey;
		$pub = $publication->getPublicationByKey ( $publicationkey );
		if (! $pub && ! $prodExport) {
			throw new Exception ( "Publication not found" );
		}
		$view = $this->dataview = $publication->getView ( $pub ["idpublication"], $viewcode );
		$lang = Zend_Controller_Front::getInstance ()->getRequest ()->getParam ( "lang", "" );
		$realRequestedCodeView = Zend_Controller_Front::getInstance ()->getRequest ()->getParam ( "viewcode" );
		// Déduire la langue des libellés depuis le codeview
		if ($lang == "" && $realRequestedCodeView != "") {
			$viewtmp = $publication->getView ( $pub ["idpublication"], $realRequestedCodeView );
			if (sizeof ( $viewtmp ) > 0) {
				$lang = $viewtmp ["locale"];
			}
		}
		elseif ($lang == "" && $realRequestedCodeView == "") {
			$viewtmp = $publication->getView ( $pub ["idpublication"], $viewcode );
			if (sizeof ( $viewtmp ) > 0) {
				$lang = $viewtmp ["locale"];
			}
		}
		elseif ($lang != "" && $realRequestedCodeView == "") {
			$viewstmp = $publication->getViews ( $pub ["idpublication"] );
			foreach ( $viewstmp as $tmpView ) {
				if ($tmpView ["locale"] == $lang) {
					$view = $this->dataview = $publication->getView ( $pub ["idpublication"], $tmpView ["viewcode"] );
				}
			}
		}
		$this->idpublication = $pub ["idpublication"];
		$this->viewcode = $view ["viewcode"];
		$this->idview = $view ["idview"];
		$this->locale = $lang;
		$this->lang = $lang;
		if (sizeof ( $program ) > 0) {
			$details = $program [0] ["details"] = $this->_data ["details"] = null;
			$chapters = $program [0] ["chapters"] = $this->_data ["chapters"] = null;
			$pictures = $program [0] ["pictures"] = $this->_data ["pictures"] = null;
			$videos = $program [0] ["videos"] = $this->_data ["videos"] = null;
			$serie = $program [0] ["serie"] = array ();
			$language = $program [0] ["language"] = array ();
			$this->_data = $program [0];
		
		// return $program[0];
		}
		return false;
	}

	public function getProgramFromSerie() {

		$pr = new program ();
		$program = $pr->getProgram ( $this->keyprog );
		$programFromSerie = $pr->getSerie ( $program [0] ["idprog_programs_of"], $this->idpublication );
		$list = array ();
		foreach ( $programFromSerie as $program ) {
			$list [] = new Model_Program ( $program ["keyprog"], $this->viewcode );
		}
		return $list;
	}

	/**
	 * Return a program's field value according to his code
	 * return false if $code_of_field not found
	 * @param null|string $code_of_field
	 */
	public function getField($code_of_field) {

		if (isset ( $this->_data ["details"] ) && array_key_exists ( $code_of_field, $this->_data ["details"] )) {
			return $this->_data ["details"] [$code_of_field] ["value"];
		}
		return null;
	}

	/**
	 * @desc Query the current object to know if it's a program or extract
	 */
	public function isExtract() {

		if ($this->program [0] ["idprog_programs_extract"] > 0) {
			if ($this->_programFrom === null) {
				$pr = new program ();
				$this->_programExtractFrom = $pr->getProgram ( $this->program [0] ["idprog_programs_extract"] );
			}
			return true;
		}
		else
			return false;
	}

	/**
	 * @desc	return all pictures associated to the current program
	 * @return array of Model_Picture
	 */
	public function getPictures() {

		if ($this->_data ["pictures"] == null) {
			$this->_getPictures ();
		}
		return $this->_data ["pictures"];
	}

	/**
	 * @desc	return all programs associated to the current program
	 * @return array of Model_Program
	 */
	public function getSerie() {

		if ($this->_serie == null)
			return $this->_serie = $this->getProgramFromSerie ();
		else return $this->_serie;
	
	}
	private $_serie;
	private $_serieList;

	/**
	 * 
	 * return the serie associated with the program under a Model_List object
	 */
	public function getSerieList() {

		if ($this->_serieList == null) {
			$serie = $this->getSerie ();
			$list = new Model_List ();
			$list->countItems = sizeof ( $serie );
			$list->_programs = $serie;
			$this->_serieList = $list;
			
			return $this->_serieList;
		}
		else
			return $this->_serieList;
	}

	/**
	 * 
	 * return a xml view of serie of program (same format as videolist)
	 */
	public function getSerielistXML() {

		$this->view->videolist = $this->getSerieList ();
		$xml = $this->view->render ( "videolist.phtml" );
		return $xml;
	}

	/**
	 * 
	 * return a json view of serie of program (same format as videolist)
	 */
	public function getSerieListJson() {

		$this->view->videolist = $this->getSerieList ();
		$xml = $this->view->render ( "videolist.phtml" );
		return Zend_Json::fromXml ( $xml );
	}

	/**
	 * Return the approriate picture according to the $type
	 * @param $type
	 * @return array of Model_Picture
	 */
	public function getPicture($type) {

		if ($this->_data ["pictures"] == null) {
			$this->_getPictures ();
		}
		foreach ( $this->_data ["pictures"] as $picture ) {
			if ($picture->usage == $type) {
				return $picture->uri;
			}
		}
		foreach ( $this->_data ["pictures"] as $picture ) {
			if ($type == "program") {
				if (preg_match ( "#_videolist|_serie#", $picture->uri ) == 0) {
					return $picture->uri;
				}
			}
			if ($type == "videolist") {
				if (preg_match ( "#_videolist#", $picture->uri )) {
					return $picture->uri;
				}
			}
			if ($type == "serie") {
				if (preg_match ( "#_serie#", $picture->uri )) {
					return $picture->uri;
				}
			}
		}
		if (sizeof ( $this->_data ["pictures"] ) > 0) {
			return $this->_data ["pictures"] [0]->uri;
		}
		return "http://" . $_SERVER ["HTTP_HOST"] . BASE_URL . "themes/system/pics/unavailable.jpg";
	}

	private function _getVideos() {

		$pr = new program ();
		
		if ($this->_data ["videos"] == null) {
			
			if (! $this->isDirect ()) {
				if ($this->publicationkey != null && ! $this->prodExport) {
					$programFrom = $pr->getProgram ( $this->program [0] ["idprog_programs_of"] );
					$videos = $pr->getVersions ( $this->program [0] ["idprog_programs_of"] );
				}
				else {
					$programFrom = $this->program;
					$videos = $pr->getVersions ( $this->program [0] ["idprog"] );
				}
				// Si extrait récupérer les versions du programme duquel il est extrait				
				

				if (sizeof ( $videos ) == 0 && $this->isExtract ()) {
					// Get version of the program wich is extract				
					$videos = $pr->getVersions ( $this->program [0] ["idprog_programs_extract"] );
				}
			}
			else {
				$infos = $this->getInfosDirect ();
				$videos = array (array ("uri" => $infos ["mms"], "lcid" => $infos ["lang"], "idversion" => 0, "codec" => "wmv" ) );
			}
			$this->_array ["videos"] = $videos;
			$this->_data ["videos"] = $this->setCollection ( $videos, "Model_Video", array ("program" => $this ) );
		}
		return $this->_data ["videos"];
	}

	/**
	 * @desc	return all videos associated to the current program
	 * @return array of Model_Video
	 */
	public function getVideos() {

		if ($this->_data ["videos"] == null) {
			$this->_getVideos ();
		}
		return $this->_data ["videos"];
	}

	/**
	 * @desc	return  video  matching to the codec $codec
	 * @param $codec
	 * @return Model_Video
	 */
	public function getVideo($codec) {

		if ($this->_data ["videos"] === null) {
			$this->_getVideos ();
		}
		$extend_codec = array ("wmv" => array ("wm" ) );
		$codec = strtolower ( $codec );
		foreach ( $this->_data ["videos"] as $video ) {
			if (strtolower ( $video->codec ) == strtolower ( $codec ) || (isset ( $extend_codec [$codec] ) && in_array ( strtolower ( $video->codec ), $extend_codec [$codec] ))) {
				return $video;
			}
		}
		return false;
	}

	/**
	 * return uri to the file asx of the first window version found
	 */
	public function getWvxUri() {

		$video = $this->getVideo ( "wmv" );
		if ($video)
			return $video->getWvxUri ( $this );
		else return false;
	}

	/**
	 * return entry asx of the first window version found
	 */
	public function getWvxEntry() {

		$this->video = $video = $this->getVideo ( "wmv" );
		if ($video)
			return $video->getWvxEntry ( $this );
		else return false;
	}

	/**
	 * @desc	return all videos associated to the current program
	 * @return string
	 */
	public function getRestUrl() {

		$tmp = "http://" . $_SERVER ["HTTP_HOST"] . BASE_URL . "rest/program/" . $this->publicationkey . "/key/" . $this->_data ["keyprog"] . "/viewcode/" . $this->viewcode; // . "/lang/" . $this->lang;
		return $tmp;
	}

	/**
	 * @return string
	 */
	public function getHtmlUrl() {

		$tmp = "http://" . $_SERVER ["HTTP_HOST"] . BASE_URL . "watch/program/index/keypub/" . $this->publicationkey . "/key/" . $this->_data ["keyprog"] . "/viewcode/" . $this->viewcode; // . "/lang/" . $this->lang;
		return $tmp;
	}

	/**
	 * @return string
	 */
	public function getHtmlUrlLecteurVideo() {

		$tmp = "http://" . $_SERVER ["HTTP_HOST"] . BASE_URL . "lecteur_video/keypub/" . $this->publicationkey . "/id/" . $this->_data ["keyprog"] . "/type/pr/lang/" . $this->lang;
		return $tmp;
	}

	/**
	 * @return string
	 */
	public function getHtmlUrlLecteurVideoBiecran() {

		$tmp = "http://" . $_SERVER ["HTTP_HOST"] . BASE_URL . "lecteur_video_biecran/keypub/" . $this->publicationkey . "/id/" . $this->_data ["keyprog"] . "/type/pr/lang/" . $this->lang;
		return $tmp;
	}

	/**
	 * @return string
	 */
	public function getHtmlUrlForVideolist() {

		$tmp = "http://" . $_SERVER ["HTTP_HOST"] . BASE_URL . "watch/videolist/program/keypub/" . $this->publicationkey . "/key/" . $this->_data ["keyprog"] . "/viewcode/" . $this->viewcode; // . "/lang/" . $this->lang;
		return $tmp;
	}

	/**
	 * @return string
	 */
	public function getHtmlUrlCode() {

		$this->initView ();
		$this->view->program = $this;
		$xml = $this->view->render ( "program_integration_urlhtml.phtml" );
		return $xml;
	}

	/**
	 * @return string
	 */
	public function getHtmlUrlWithPopupCode() {

		$this->initView ();
		$this->view->program = $this;
		$xml = $this->view->render ( "program_integration_linkhtmlpopup.phtml" );
		return $xml;
	}

	/**
	 * @return string
	 */
	public function getHtmlAnimWithPopupCode() {

		$this->initView ();
		$this->view->program = $this;
		$xml = $this->view->render ( "program_integration_animhtmlpopup.phtml" );
		return $xml;
	}

	/**
	 * @return string
	 */
	public function getIframeEmbedSilverlightCode($options = array()) {

		$defaultOptions = array ("width" => "320px", "height" => "240px", "button" => "10111101101110", "filter" => "" );
		$defaultOptions = array_merge ( $defaultOptions, $options );
		$this->initView ();
		$this->view->options = $defaultOptions;
		$this->view->program = $this;
		$this->view->url = $this->getSilverlightUrlWithParams ( $defaultOptions );
		$xml = $this->view->render ( "program_integration_iframe_silverlight.phtml" );
		return $xml;
	}

	public function getSilverlightUrlWithParams($options = array()) {

		$defaultOptions = array ("width" => "320", "height" => "240", "button" => "10111101101110", "filter" => "", "autoplay" => "false", "dualscreen" => "0", "currentChapterDisplay" => 0, "culture" => $this->lang );
		$defaultOptions = array_merge ( $defaultOptions, $options );
		$url = "http://" . $_SERVER ["HTTP_HOST"] . BASE_URL . "watch/silverlight/player/publicationKey/%s/type/pr/id/%s";
		$lang = $this->lang;
		$url = sprintf ( $url, $this->publicationkey, $this->keyprog );
		foreach ( $defaultOptions as $key => $value ) {
			$url .= "/{$key}/{$value}";
		}
		return $url;
	}

	/**
	 * @return string
	 */
	public function getEmbedSilverlightCode($options = array()) {

		$defaultOptions = array ("width" => "320px", "height" => "240px", "button" => "10111101101110", "filter" => "" );
		$defaultOptions = array_merge ( $defaultOptions, $options );
		$this->initView ();
		$this->view->options = $defaultOptions;
		$this->view->program = $this;
		$xml = $this->view->render ( "program_integration_silverlight.phtml" );
		return $xml;
	}

	/**
	 * @return string
	 */
	public function getSilverlightUrlWithPopupCode($options = array()) {

		$defaultOptions = array ("width" => "320", "height" => "240", "button" => "10111101101110", "filter" => "" );
		$defaultOptions = array_merge ( $defaultOptions, $options );
		$this->initView ();
		$this->view->options = $defaultOptions;
		$this->view->program = $this;
		$xml = $this->view->render ( "program_integration_silverlightlinkpopup.phtml" );
		return $xml;
	}

	/**
	 * @return string
	 */
	public function getSilverlightAnimWithPopupCode($options = array()) {

		$defaultOptions = array ("width" => "320", "height" => "240", "button" => "10111101101110", "filter" => "" );
		$defaultOptions = array_merge ( $defaultOptions, $options );
		$this->initView ();
		$this->view->options = $defaultOptions;
		$this->view->program = $this;
		$xml = $this->view->render ( "program_integration_silverlightanimpopup.phtml" );
		return $xml;
	}

	/**
	 * Initialize view for code to copy paste
	 */
	private function initView() {

		$this->view->idprog = $this->idprog;
		$this->view->idview = $this->idview;
		$this->view->locale = $this->locale;
		$this->view->lang = $this->lang;
		$this->view->viewcode = $this->viewcode;
		$this->view->publicationKey = $this->publicationkey;
	}

	/**
	 * @return string
	 */
	public function getHtmlIframeCode() {

		$this->initView ();
		$this->view->program = $this;
		$xml = $this->view->render ( "program_integration_iframehtml.phtml" );
		return $xml;
	}

	private function _getPictures() {

		if ($this->_data ["pictures"] == null) {
			$pr = new program ();
			if (! $this->isDirect ()) {
				$pictures = $pr->getPictures ( $this->program [0] ["idprog"] );
			}
			else {
				if ($this->program [0] ["idprog_programs_extract"] != "") {
					$pictures = $pr->getPictures ( $this->program [0] ["idprog_programs_extract"] );
				}
				elseif ($this->program [0] ["idprog_programs_of"] != "") {
					$pictures = $pr->getPictures ( $this->program [0] ["idprog_programs_of"] );
				}
				else {
					$pictures = $pr->getPictures ( $this->program [0] ["idprog"] );
				}
			}
			for($i = 0; $i < sizeof ( $pictures ); $i ++) {
				$pictures [$i] ["original_value"] = $pictures [$i] ["uri"];
				$pictures [$i] ["uri"] = $this->relativeToAbsolute ( $pictures [$i] ["uri"] );
			}
			//Zend_Debug::dump($pictures);
			$this->_array ["pictures"] = $pictures;
			$this->_data ["pictures"] = $this->setCollection ( $pictures, "Model_Picture" );
		}
		return $this->_data ["pictures"];
	}
	
	private $chaptersSemantics = null;

	public function getChaptersSemantics(&$chapters = array(), $idProgram) {

		require_once MODULE_DIRECTORY . '/tools/models/semantic.php';
		if ($this->chaptersSemantics === null && ZN_Utils::get ( @$this->_config ["semantic_enable"], false )) {
			$idCache = "chaptersemantic_" . $idProgram . "_" . $this->idplaylist;
			$cacheTags = array ("chapter", "semantic" );
			if (! ($data = $this->_cache->load ( $idCache ))) {
				$semantic = new semantic ();
				$tmp = Zend_Json::decode ( $semantic->getChapterSemanticsByProgram ( $idProgram, $this->idplaylist, 'JSON' ) );
				$data = $this->chaptersSemantics = @$tmp ["results"] ["bindings"];
				$this->_cache->save ( $data, $idCache, $cacheTags );
			}
			$this->chaptersSemantics = $data;
		}
		if ($this->chaptersSemantics !== null && is_array ( $this->chaptersSemantics )) {
			
			for($i = 0; $i < sizeof ( $this->chaptersSemantics ); $i ++) {
				$chapterUri = $this->chaptersSemantics [$i] ["target"] ["value"];
				$idChapterUri = array_pop ( explode ( "/", $chapterUri ) );
				//Zend_Debug::dump($this->chaptersSemantics[$i]);
				//Zend_Debug::dump($idChapterUri,"idchapter");
				$indice = ZN_Utils_Array::recursiveArraySearch ( $chapters, $idChapterUri );
				$chapters [$indice] ["semantics"] [] = $this->chaptersSemantics [$i];
			}
			/*
			Zend_Debug::dump($chapters);
			Zend_Debug::dump($this->chaptersSemantics);
			exit;
			*/
		}
		return $this->chaptersSemantics;
	}

	/**
	 * @desc	return all chapters associated to the current program
	 * @return array of Model_Program_Chapter
	 */
	public function getChapters() {

		if ($this->_data ["chapters"] == null) {
			$pr = new program ();
			$idProgram = null;
			if (! $this->isDirect ()) {
				$idProgram = $this->program [0] ["idprog"];
				$chapters = $pr->getChapters ( $this->program [0] ["idprog"], $this->idplaylist, 0, $this->dataview ["idview"], $this->lang );
			}
			else {
				if ($this->program [0] ["idprog_programs_extract"] != "") {
					$idProgram = $this->program [0] ["idprog_programs_extract"];
					$chapters = $pr->getChapters ( $this->program [0] ["idprog_programs_extract"], 0, 0, 0, $this->lang, 'order', 1 );
				}
				elseif ($this->program [0] ["idprog_programs_of"] != "") {
					$idProgram = $this->program [0] ["idprog_programs_of"];
					$chapters = $pr->getChapters ( $this->program [0] ["idprog_programs_of"], 0, 0, 0, $this->lang, 'order', 1 );
				}
				else {
					$idProgram = $this->program [0] ["idprog"];
					$chapters = $pr->getChapters ( $this->program [0] ["idprog"], $this->idplaylist, 0, $this->dataview ["idview"], $this->lang );
				}
			}
			$this->getChaptersSemantics ( $chapters, $idProgram );
			//Zend_Debug::dump($chapters);
			for($i = 0; $i < sizeof ( $chapters ); $i ++) {
				if (isset ( $chapters [$i] ["details"] ) && is_array ( $chapters [$i] ["details"] )) {
					foreach ( $chapters [$i] ["details"] as &$field ) {
						if ($field ["type"] == "PICTURE" || $field ["type"] == "FILE") {
							$field ["value"] = $this->relativeToAbsolute ( $field ["value"] );
						}
					}
				}
			
			}
			//            $this->_data["chapters"] = $chapters;
			$this->_array ["chapters"] = $chapters;
			$this->_data ["chapters"] = $this->setCollection ( $chapters, "Model_Program_Chapter" ); //  $pr->getChapters($program[0]["idprog"], null, null);
		}
		return $this->_data ["chapters"];
	}

	/**
	 * If program is an extract, we check tc in and tcout directly on the extract in the production, not in catalogue cause maj can cause malfunctions
	 * 
	 */
	public function adjustExtractDetailsInformations() {

		$pr = new program ();
		if ($this->program [0] ["idprog_programs_extract"] != "" && $this->program [0] ["idprog_programs_of"] != "") {
			$tmp = $pr->getValues ( $this->program [0] ["idprog_programs_of"], 0, $this->lang );
			if (isset ( $tmp ["duration"] ) && isset ( $tmp ["duration"] ["value"] )) {
				$this->program [0] ["details"] ["duration"] ["value"] = $tmp ["duration"] ["value"];
				$this->program [0] ["details"] ["duration"] ["original_value"] = $tmp ["duration"] ["original_value"];
			}
			$origin = $pr->getProgram ( $this->program [0] ["idprog_programs_of"] );
			$this->program [0] ["tcin"] = $this->_data ["tcin"] = $origin [0] ["tcin"];
			$this->program [0] ["tcout"] = $this->_data ["tcout"] = $origin [0] ["tcout"];
		}
	}

	public function getDetails() {

		if ($this->_data ["details"] == null) {
			$pr = new program ();
			if (! $this->isDirect ()) {
				$this->program [0] ["details"] = $pr->getValues ( $this->program [0] ["idprog"], $this->dataview ["idview"], $this->lang );
				$this->adjustExtractDetailsInformations ();
			}
			else {
				
				if ($this->program [0] ["idprog_programs_extract"] != "") {
					$this->program [0] ["details"] = $pr->getValues ( $this->program [0] ["idprog_programs_extract"], 0, $this->lang );
				}
				elseif ($this->program [0] ["idprog_programs_of"] != "") {
					$this->program [0] ["details"] = $pr->getValues ( $this->program [0] ["idprog_programs_of"], 0, $this->lang );
				}
				else {
					$this->program [0] ["details"] = $pr->getValues ( $this->program [0] ["idprog"], 0, $this->lang );
				}
			}
			foreach ( $this->program [0] ["details"] as &$field ) {
				if ($field ["type"] == "PICTURE" || $field ["type"] == "FILE") {
					$field ["value"] = $this->relativeToAbsolute ( $field ["value"] );
				}
			}
			$this->_array ["details"] = $this->program [0] ["details"];
			$this->_data ["details"] = $this->program [0] ["details"];
		}
		return $this->_data ["details"];
	}

	/**
	 * Init all properties in one time
	 * Enter description here ...
	 */
	public function init() {

		$this->getDetails ();
		$this->getChapters ();
		$this->getPictures ();
		$this->getVideos ();
	}

	/**
	 * @desc Magic function to get properties from the array data of the object
	 * @param unknown_type $key
	 */
	public function __get($key) {

		if ($this->_data ["details"] == null) {
			$this->_data ["details"] = $this->getDetails ();
		}
		if (isset ( $this->_data ["details"] ) && array_key_exists ( $key, $this->_data ["details"] )) {
			return $this->_data ["details"] [$key] ["value"];
		}
		if (array_key_exists ( $key, $this->_data )) {
			if ($key == "chapters" && $this->_data [$key] === null) {
				return $this->getChapters ();
			}
			if ($key == "pictures" && $this->_data [$key] === null) {
				return $this->_getPictures ();
			}
			if ($key == "videos" && $this->_data [$key] === null) {
				return $this->_getVideos ();
			}
			return $this->_data [$key];
		}
		return null;
	}

	/**
	 * return uri to the file needed by the flash animation
	 * @param unknown_type $filePrefix
	 * @param unknown_type $url
	 * @param unknown_type $titleOfTheSerie
	 */
	public function getFileForFlash($filePrefix = "program", $url = "", $titleOfTheSerie = "") {

		$string = "";
		$count = 0;
		$string .= ("&title_$count=" . $this->title . "&pic_$count=" . $this->getPicture ( "program" ) . "&pos_$count=$count&title=$titleOfTheSerie");
		$string = "&total=1$string";
		if ($url != "") {
			$string .= "&url=$url";
		}
		$filename = PUBLIC_TEMP_FLASH . "flash_" . $filePrefix . "_" . $this->keyprog . ".txt";
		$handle = fopen ( $filename, "w+" );
		fwrite ( $handle, $string );
		fclose ( $handle );
		$tmp = str_replace ( DOCUMENT_ROOT, "", $filename );
		$tmp = "http://" . $_SERVER ["HTTP_HOST"] . str_replace ( "\\", "/", $tmp );
		return $tmp;
	}

	public function getFlashVarsUrl() {

		return $this->getFileForFlash ( "popup_program", $this->getHtmlUrl () );
	}

	public function getSilverlightUrl() {

		$url = "http://" . $_SERVER ["HTTP_HOST"] . BASE_URL . "watch/silverlight/player/publicationKey/%s/type/pr/id/%s/culture/%s";
		$lang = $this->lang;
		/*
        if($this->lang != "en" && $this->lang != "fr")
            $lang = "en";
          */
		$url = sprintf ( $url, $this->publicationkey, $this->keyprog, $lang );
		return $url;
	}

	public function getSilverlightAnimRessourceUrl() {

		$url = "http://" . $_SERVER ["HTTP_HOST"] . BASE_URL . "rest/slideshow/%s/type/PROGRAM/id/%s/lang/%s";
		$lang = $this->lang;
		$url = sprintf ( $url, $this->publicationkey, $this->keyprog, $lang );
		return $url;
	}

	static public function getDirectState($key) {

		$program = new program ();
		$program_data = $program->getProgram ( $key );
		if (sizeof ( $program_data [0] ) > 0) {
			// Publication
			if ($program_data [0] ["idpublication"] > 0 && $program_data [0] ["idprog_programs_of"] > 0) {
				
				if ($program_data [0] ["idprog_programs_extract"] > 0) {
					$tmp = $program->getProgram ( $program_data [0] ["idprog_programs_extract"] );
				}
				else {
					$tmp = $program->getProgram ( $program_data [0] ["idprog_programs_of"] );
				}
				return $tmp [0] ["direct"] > 0 ? true : false;
			}
			// Production
			else {
				if ($program_data [0] ["idprog_programs_extract"] > 0) {
					$tmp = $program->getProgram ( $program_data [0] ["idprog_programs_extract"] );
					return $tmp [0] ["direct"] > 0 ? true : false;
				}
				else {
					return $program_data [0] ["direct"] > 0 ? true : false;
				}
			
			}
		}
	
	}

	/**
	 * 
	 * Return true or false if program is in direct mode
	 */
	public function isDirect() {

		$pr = new program ();
		// Programme via une publication
		if ($this->publicationkey != null) {
			if ($this->program [0] ["idprog_programs_extract"] > 0) {
				$programFrom = $pr->getProgram ( $this->program [0] ["idprog_programs_extract"] );
				return $programFrom [0] ['direct'] > 0 ? true : false;
			}
			$programFrom = $pr->getProgram ( $this->program [0] ["idprog_programs_of"] );
			return $programFrom [0] ['direct'] > 0 ? true : false;
		}
		elseif ($this->program [0] ["idprog_programs_extract"] > 0) {
			$programFrom = $pr->getProgram ( $this->program [0] ["idprog_programs_extract"] );
			return $programFrom [0] ['direct'] > 0 ? true : false;
		}
		return $this->program [0] ["direct"] > 0 ? true : false;
	}

	public function getInfosDirect() {

		$pr = new program ();
		if ($this->publicationkey != null) {
			if ($this->program [0] ["idprog_programs_extract"] > 0)
				return $pr->getDirect ( $this->program [0] ["idprog_programs_extract"] );
			else return $pr->getDirect ( $this->program [0] ["idprog_programs_of"] );
		}
		elseif ($this->program [0] ["idprog_programs_extract"] > 0) {
			return $pr->getDirect ( $this->program [0] ["idprog_programs_extract"] );
		}
		return $pr->getDirect ( $this->program [0] ["idprog"] );
	}
}