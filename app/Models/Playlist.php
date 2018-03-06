<?php
require_once MODULE_DIRECTORY . '/sadmin/models/publication.php';
require_once MODULE_DIRECTORY . '/pub/models/playlist.php';
require_once MODULE_DIRECTORY . '/prod/models/programs_group.php';
require_once MODULE_DIRECTORY . '/prod/models/programs_group_parameters.php';
class Model_Playlist extends Model_Api
{
    public $viewcode = "";
    public $publicationkey;
    public $key;
    public $lang;
    /**
     * 
     * @var array of Model_Video
     */
    public $videos;
    public function __construct ()
    {
        parent::__construct();
        $this->view->setScriptPath(MODULE_DIRECTORY . 'api/views/scripts/model');
        if (func_num_args() > 0) {
            return call_user_func_array(array($this , "__constructv1"), func_get_args());
        }
    }
    public function toJson(){
    	      
        $this->view->playlist = $this;
        $this->view->publicationkey = $this->publicationkey;
        $xml = $this->view->render("playlist.phtml");
        return  Zend_Json::fromXml($xml, true);
        
    }
    public static function factory ($params = array())
    {
        $defaultParams = array("idplaylist" => 0 , "viewcode" => null , "lang" => null , "publicationkey" => null);
        $params = array_merge($defaultParams, $params);
        $objectPlaylist = new Model_Playlist();
        $objectPlaylist->idpublication = $objectPlaylist->getIdPublication($params["publicationkey"]);
        $objectPlaylist->idviewWanted = $objectPlaylist->getIdView($this->idpublication, ZN_Utils::get($params["viewcode"], "default"));
        $objectPlaylist->idviewDefault = $objectPlaylist->getIdView($this->idpublication, "default");
        $objectPlaylist->publicationkey = $params["publicationkey"];
        $objectPlaylist->key = $params["key"];
        $pl = new playlist();
        $playlist = $pl->getPlaylistFromKey($params["key"]);
        $playlist["picture"] = $objectPlaylist->relativeToAbsolute($playlist["picture"]);
        if (! $playlist) {
            throw new ZN_Exception("Playlist not found");
        }
        $publication = new publication();
        $pub = $publication->getPublicationByKey($publicationkey);
        if (! $pub) {
            throw new Exception("Publication not found");
        }
        $view = null;
        if ($params["viewcode"] !== null) {
            $view = $publication->getView($pub["idpublication"], $params["viewcode"]);
            $objectPlaylist->viewcode = $params["viewcode"];
            $objectPlaylist->lang = ZN_Utils::get("lang", $view["locale"]);
        } else {
            if ($params["lang"] !== null) {
                $viewstmp = $publication->getViews($pub["idpublication"]);
                foreach ($viewstmp as $tmpView) {
                    if ($tmpView["locale"] == $requestLang) {
                        $view = $publication->getView($pub["idpublication"], $tmpView["viewcode"]);
                        $objectPlaylist->viewcode = $viewcode = $tmpView["viewcode"];
                        $objectPlaylist->lang = $params["lang"];
                    }
                }
            }
            if ($params["lang"] === null && $view === null) {
                $params["viewcode"] = "default";
                $view = $publication->getView($pub["idpublication"], $params["viewcode"]);
                if (sizeof($viewtmp) > 0) {
                    $objectPlaylist->viewcode = $params["viewcode"];
                    $lang = $view["locale"];
                }
            }
        }
        $programs = $pl->getPrograms($playlist["idplaylist"]);
        $tmpArray = array();
        $pr = new program();
        foreach ($programs as &$program) {
            $tmp = $pr->getProgram($program["idprog"]);
            if ($pr->isPublished($tmp[0]["idprog_programs_of"], $objectPlaylist->idpublication)) {
                $tmpArray[] = new Model_Program($tmp[0]["keyprog"], $params["viewcode"], $params["publicationkey"], $playlist["idplaylist"]);
            }
        }
        $playlist["programs"] = $tmpArray;
        $objectPlaylist->_data = $playlist;
        return $objectPlaylist;
         //Zend_Debug::dump($playlist);exit;
    }
    /**
     * @deprecated     
     * @param unknown_type $publicationkey
     * @param unknown_type $key
     * @param unknown_type $viewcode
     */
    public function __constructv1 ($publicationkey, $key, $viewcode = "default")
    {
        //parent::__construct();
        //$this->view->setScriptPath(MODULE_DIRECTORY . 'api/views/scripts/model');
        $this->idpublication = $this->getIdPublication($publicationkey);
        $this->idviewWanted = $this->getIdView($this->idpublication, $viewcode);
        $this->idviewDefault = $this->getIdView($this->idpublication, "default");
        $this->publicationkey = $publicationkey;
        $this->key = $key;
        $pl = new playlist();
        $playlist = $pl->getPlaylistFromKey($key);
        $playlist["picture"] = $this->relativeToAbsolute($playlist["picture"]);
        if (! $playlist) {
            throw new ZN_Exception("Playlist not found");
        }
        $publication = new publication();
        $pub = $publication->getPublicationByKey($publicationkey);
        if (! $pub) {
            throw new Exception("Publication not found");
        }
        $requestViewCode = Zend_Controller_Front::getInstance()->getRequest()->getParam('viewcode', null);
        $requestLang = Zend_Controller_Front::getInstance()->getRequest()->getParam('lang', null);
        $view = null;
        if ($viewcode != null) {
            $view = $publication->getView($pub["idpublication"], $viewcode);
            $this->viewcode = $viewcode;
            $this->lang = $requestLang != null ? $requestLang : $view["locale"];
        } else {
            if ($requestLang != null) {
                $viewstmp = $publication->getViews($pub["idpublication"]);
                foreach ($viewstmp as $tmpView) {
                    if ($tmpView["locale"] == $requestLang) {
                        $view = $publication->getView($pub["idpublication"], $tmpView["viewcode"]);
                        $this->viewcode = $viewcode = $tmpView["viewcode"];
                        $this->lang = $requestLang;
                    }
                }
            }
            if ($requestLang == null && $view == null) {
                $viewcode = "default";
                $view = $publication->getView($pub["idpublication"], $viewcode);
                if (sizeof($viewtmp) > 0) {
                    $this->viewcode = $viewcode;
                    $lang = $view["locale"];
                }
            }
        }
        $programs = $pl->getPrograms($playlist["idplaylist"]);
        $tmpArray = array();
        $pr = new program();
        foreach ($programs as &$program) {
            $tmp = $pr->getProgram($program["idprog"]);
            if ($pr->isPublished($tmp[0]["idprog_programs_of"], $this->idpublication)) {
                $tmpArray[] = new Model_Program($tmp[0]["keyprog"], $viewcode, $publicationkey, $playlist["idplaylist"]);
            }
        }
        $playlist["programs"] = $tmpArray;
        $this->_data = $playlist;
         //Zend_Debug::dump($playlist);exit;
    }
    /**
     * @return Zend_Paginator
     */
    public function getPrograms ()
    {
        return $this->_data["programs"];
    }
    /**
     * @desc	return all videos associated to the current program
     * @return string
     */
    public function getRestUrl ()
    {
        $tmp = "http://" . $_SERVER["HTTP_HOST"] . BASE_URL . "rest/playlist/" . $this->publicationkey . "/key/" . $this->key . "/viewcode/" . $this->viewcode; // . "/lang/" . $this->lang;
        return $tmp;
    }
    /**
     * @return string
     */
    public function getHtmlUrl ()
    {
        $tmp = "http://" . $_SERVER["HTTP_HOST"] . BASE_URL . "watch/playlist/index/keypub/" . $this->publicationkey . "/key/" . $this->key . "/viewcode/" . $this->viewcode; // . "/lang/" . $this->lang;
        return $tmp;
    }
    /**
     * @return string
     */
    public function getHtmlUrlWithPopupCode ()
    {
        $this->initView();
        $this->view->playlist = $this;
        $xml = $this->view->render("playlist_integration_linkhtmlpopup.phtml");
        return $xml;
    }
    /**
     * @return string
     */
    public function getHtmlUrlCode ()
    {
        $this->initView();
        $this->view->playlist = $this;
        $xml = $this->view->render("playlist_integration_urlhtml.phtml");
        return $xml;
    }
    /**
     * @return string
     */
    public function getHtmlIframeCode ()
    {
        $this->initView();
        $this->view->playlist = $this;
        $xml = $this->view->render("playlist_integration_iframehtml.phtml");
        return $xml;
    }
    /**
     * @return string
     */
    public function getHtmlAnimWithPopupCode ()
    {
        $this->initView();
        $this->view->playlist = $this;
        $xml = $this->view->render("playlist_integration_animhtmlpopup.phtml");
        return $xml;
    }
    public function getFlashVarsUrl ()
    {
        return $this->getFileForFlash("popup_playlist", $this->getHtmlUrl(), $this->title);
    }
    public function getFileForFlash ($filePrefix = "playlist", $url = "", $titleOfTheSerie = "")
    {
        $string = "";
        $count = 0;
        $programs = $this->getPrograms();
        if (sizeof($programs) > 0) {
            foreach ($programs as $program) {
                $string .= ("&title_$count=" . $program->title . "&pic_$count=" . $program->getPicture("program") . "&pos_$count=$count");
                $count ++;
            }
        } else {
            $string = ("&title_$count=null&pic_$count=http://" . $_SERVER["HTTP_HOST"] . BASE_URL . "themes/system/pics/unavailable.jpg&pos_$count=$count");
        }
        $string = "&total=" . ($count + 1) . "$string&title=$titleOfTheSerie";
        if ($url != "") {
            $string .= "&url=$url";
        }
        $filename = PUBLIC_TEMP_FLASH . "flash_" . $filePrefix . "_" . $this->key . ".txt";
        $handle = fopen($filename, "w+");
        fwrite($handle, $string);
        fclose($handle);
        $tmp = str_replace(DOCUMENT_ROOT, "", $filename);
        $tmp = "http://" . $_SERVER["HTTP_HOST"] . str_replace("\\", "/", $tmp);
        return $tmp;
    }
    /**
     * @return string
     */
    public function getEmbedSilverlightCode ($options = array())
    {
        $defaultOptions = array("width" => "320px" , "height" => "240px");
        $defaultOptions = array_merge($defaultOptions, $options);
        $this->initView();
        $this->view->options = $defaultOptions;
        $this->view->playlist = $this;
        $xml = $this->view->render("playlist_integration_silverlight.phtml");
        return $xml;
    }
    /**
     * @return string
     */
    public function getIframeEmbedSilverlightCode ($options = array())
    {
        $defaultOptions = array("width" => "320px" , "height" => "240px" , "button" => "10111101101110" , "filter" => "");
        $defaultOptions = array_merge($defaultOptions, $options);
        $this->initView();
        $this->view->options = $defaultOptions;
        $this->view->program = $this;
        $this->view->url = $this->getSilverlightUrlWithParams($defaultOptions);
        $xml = $this->view->render("playlist_integration_iframe_silverlight.phtml");
        return $xml;
    }
    public function getSilverlightUrlWithParams ($options = array())
    {
        $defaultOptions = array("width" => "320" , "height" => "240" , "button" => "10111101101110" , "filter" => "" , "autoplay" => "false" , "dualscreen" => "0" , "currentChapterDisplay" => 0 , "culture" => $this->lang);
        $defaultOptions = array_merge($defaultOptions, $options);
        $url = "http://" . $_SERVER["HTTP_HOST"] . BASE_URL . "watch/silverlight/player/publicationKey/%s/type/pl/id/%s";
        $lang = $this->lang;
        $url = sprintf($url, $this->publicationkey, $this->key);
        foreach ($defaultOptions as $key => $value) {
            $url .= "/{$key}/{$value}";
        }
        return $url;
    }
    private function initView ()
    {
        $this->view->key = $this->key;
        $this->view->locale = $this->lang;
        $this->view->viewcode = $this->viewcode;
        $this->view->publicationKey = $this->publicationkey;
    }
    /**
     * @return string
     */
    public function getSilverlightUrlWithPopupCode ($options = array())
    {
        $defaultOptions = array("width" => "320px" , "height" => "240px");
        $defaultOptions = array_merge($defaultOptions, $options);
        $this->initView();
        $this->view->options = $defaultOptions;
        $this->view->playlist = $this;
        $xml = $this->view->render("playlist_integration_silverlightlinkpopup.phtml");
        return $xml;
    }
    /**
     * @return string
     */
    public function getSilverlightAnimWithPopupCode ($options = array())
    {
        $defaultOptions = array("width" => "320px" , "height" => "240px");
        $defaultOptions = array_merge($defaultOptions, $options);
        $this->initView();
        $this->view->options = $defaultOptions;
        $this->view->playlist = $this;
        $xml = $this->view->render("playlist_integration_silverlightanimpopup.phtml");
        return $xml;
    }
    /**
     * @return string
     */
    public function getHtmlUrlLecteurVideo ()
    {
        $tmp = "http://" . $_SERVER["HTTP_HOST"] . BASE_URL . "lecteur_video/keypub/" . $this->publicationkey . "/id/" . $this->key . "/type/pl/lang/" . $this->lang;
        return $tmp;
    }
    /**
     * @return string
     */
    public function getHtmlUrlLecteurVideoBiecran ()
    {
        $tmp = "http://" . $_SERVER["HTTP_HOST"] . BASE_URL . "lecteur_video_biecran/keypub/" . $this->publicationkey . "/id/" . $this->key . "/type/pl/lang/" . $this->lang;
        return $tmp;
    }
    public function getSilverlightUrl ()
    {
        $url = "http://" . $_SERVER["HTTP_HOST"] . BASE_URL . "watch/silverlight/player/publicationKey/%s/type/pl/id/%s/culture/%s";
        $lang = $this->lang;
        /*
        if($this->lang != "en" && $this->lang != "fr")
            $lang = "en";
          */
        $url = sprintf($url, $this->publicationkey, $this->key, $lang);
        return $url;
    }
    public function getSilverlightAnimRessourceUrl ()
    {
        $url = "http://" . $_SERVER["HTTP_HOST"] . BASE_URL . "rest/slideshow/%s/type/PLAYLIST/id/%s/lang/%s";
        $lang = $this->lang;
        $url = sprintf($url, $this->publicationkey, $this->key, $lang);
        return $url;
    }
    public function getWvx ()
    {
        $programs = $this->getPrograms();
        $asx = '<asx version="3.0">%s</asx>';
        $tmp = "";
        foreach ($programs as $prog) {
            $tmp .= $prog->getWvxEntry();
            $this->videos[] = $prog->video;
        }
        return sprintf($asx, $tmp);
    }
    public function getVideosFromWvx ()
    {
        if (empty($this->videos)) {
            $this->getWvx();
        }
        return $this->videos;
    }
    /**
     * @return string
     */
    public function getWvxUri ()
    {
        //$this->count++; 
        //Zend_Debug::dump("tata");                
        $this->_logger->log(microtime(), Zend_log::INFO);
        $filename = PUBLIC_TEMP_ASX . "playlist_" . md5($this->key) . ".asx";
        $handle = fopen($filename, "w+");
        fwrite($handle, $this->getWvx());
        fclose($handle);
        $tmp = str_replace(DOCUMENT_ROOT, "", $filename);
        $tmp = "http://" . $_SERVER["HTTP_HOST"] . str_replace("\\", "/", $tmp);
        return $tmp;
    }
    public function getPicture ()
    {
        return $this->_data["picture"];
    }
    public function getWindowsMediaObject ()
    {
        $embeded = '<object id="PlayerWmEmbeded" width="320" height="305"
classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">
<param name="URL" value="' . $this->getWvxUri() . '">
<param name="uiMode" value="full">
<param name="AutoStart" value="false">
<param name="stretchToFit" value="true">
<embed type="application/x-mplayer2" 
pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" 
src="' . $this->getWvxUri() . '"  name="MediaPlayer1"
width="320" height="305" uiMode="full" AutoStart="0">
</embed></object>';
        return $embeded;
    }
}