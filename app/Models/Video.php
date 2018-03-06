<?php
class Model_Video extends Model_Api
{
    /**
     * Context is utilize to set user, program and publication when exists. Objective = stats
     * @var Model_Program
     */
    public $program;
    /**
     * @return array 
     */
    function getLangues ()
    {
        $languages = @$this->_data["lcid"];
        if ($languages == "")
            array();
        $languages = explode(",", $languages);
        $lang_libelle = array();
        $libelle = array();
        $libelle_other = array();
        $lang = $this->_lang;
        $config = Zend_Registry::get("config");
        $host = $_SERVER["HTTP_HOST"];
        $other = array();
        $LangueBDDOrder = array();
        for ($i = 0; $i < sizeof($languages); $i ++) {
            if (trim($languages[$i]) == "")
                break;
            $strSQL = "SELECT libelle FROM enum_lcid where lcid='$languages[$i]'";
            $result = $this->_db->fetchAll($strSQL);
            $pic = 'http://' . $host . BASE_URL . '/themes/system/pics/lcid/' . $languages[$i] . '.gif';
            $LangueBDDOrder[] = array("libelle" => $result[0]["libelle"] , "lcid" => $languages[$i] , "picture" => $pic);
            // Tri par importance
            if ($languages[$i] != "2057" && $languages[$i] != "1036" && $languages[$i] != "1033") {
                $libelle[] = $result[0]["libelle"];
                $lang_libelle[] = array("libelle" => $result[0]["libelle"] , "lcid" => $languages[$i] , "picture" => $pic);
            } else {
                $other[] = array("libelle" => $result[0]["libelle"] , "lcid" => $languages[$i] , "picture" => $pic);
                $libelle_other[] = $result[0]["libelle"];
            }
        }
        array_multisort($libelle, $lang_libelle);
        array_multisort($libelle_other, SORT_DESC, $other);
        $lang_libelle = array_merge($other, $lang_libelle);
        return $LangueBDDOrder;
    }
    static $count = 0;
    /**
     * @return string
     */
    public function getWvxUri (Model_Program $program)
    {
        //$this->count++; 
        //Zend_Debug::dump("tata");                
        $this->_logger->log(microtime(), Zend_log::INFO);
        $filename = PUBLIC_TEMP_ASX . md5($program->keyprog . $this->filename) . ".asx";
        $handle = fopen($filename, "w+");
        fwrite($handle, $this->getWvx($program));
        fclose($handle);
        $tmp = str_replace(DOCUMENT_ROOT, "", $filename);
        $tmp = "http://" . $_SERVER["HTTP_HOST"] . str_replace("\\", "/", $tmp);
        return $tmp;
    }
    /**
     * @return string
     */
    private function getWvx (Model_Program $program)
    {
        $asx = '<asx version="3.0">' . $this->getWvxEntry($program) . '</asx>';
        return $asx;
    }
    /**
     * @return string
     */
    public function getWvxEntry (Model_Program $program)
    {
        $extract = '<starttime value="%s" /><duration value="%s" />';
        $tmp = "";
        if ($program->tcin != "") {
            $tcin = ZN_Utils_Timecode::input($program->tcin);
            $tcout = ZN_Utils_Timecode::input($program->tcout);
            $tcinsec = ZN_Utils_Timecode::tcToSec($tcin);
            $tcoutsec = ZN_Utils_Timecode::tcToSec($tcout);
            $tot = $tcoutsec - $tcinsec;
            $extract = sprintf($extract, ZN_Utils_Timecode::tcToString(ZN_Utils_Timecode::secToTc($tcinsec)), ZN_Utils_Timecode::tcToString(ZN_Utils_Timecode::secToTc($tot)));
            $tmp = $extract;
        }
        $asx = '<entry><ref href="' . $this->getUri() . '" /><title>' . base64_encode($program->title) . '</title>' . $tmp . '</entry>';
        return $asx;
    }
    public static function makeWVX ($uri, $filename, $keyprogram, $title, $tcin, $tcout)
    {
        $extract = '<starttime value="%s" /><duration value="%s" />';
        $tmp = "";
        if ($tcin) {
            $tcin = ZN_Utils_Timecode::input($tcin);
            $tcout = ZN_Utils_Timecode::input($tcout);
            $tcinsec = ZN_Utils_Timecode::tcToSec($tcin);
            $tcoutsec = ZN_Utils_Timecode::tcToSec($tcout);
            $tot = $tcoutsec - $tcinsec;
            $extract = sprintf($extract, ZN_Utils_Timecode::tcToString(ZN_Utils_Timecode::secToTc($tcinsec)), ZN_Utils_Timecode::tcToString(ZN_Utils_Timecode::secToTc($tot)));
            $tmp = $extract;
        }
        $asx = '<entry><ref href="' . $uri . '" /><title>' . base64_encode($title) . '</title>' . $tmp . '</entry>';
        $asx = '<asx version="3.0">' . $asx . '</asx>';
        $filename = PUBLIC_TEMP_ASX . md5($keyprogram . $filename) . ".asx";
        $handle = fopen($filename, "w+");
        fwrite($handle, $asx);
        fclose($handle);
        $filename = str_ireplace("//", "/", $filename);
        $filename = str_ireplace('\\\\', '\\', $filename);
        $tmp = str_replace(DOCUMENT_ROOT, "", $filename);
        $tmp = "http://" . $_SERVER["HTTP_HOST"] . str_replace("\\", "/", $tmp);
        return $tmp;
    }
    /**
     * @return string
     */
    public function getUri ()
    {
        $identification = "";
        if ($this->_auth->hasIdentity()) {}
        $tmpUri = $this->_data["uri"] . "?idversion=" . $this->_data["idversion"] . "&key=" . $this->program->idprog_programs_of . "&pubkey=" . $this->program->publicationkey;
        return $tmpUri;
    }
    public function getObject (Model_Program $program)
    {
        $embeded = '<object id="PlayerWmEmbeded" width="320" height="305"
classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6">
<param name="URL" value="' . $this->getWvxUri($program) . '">
<param name="uiMode" value="full">
<param name="AutoStart" value="false">
<param name="stretchToFit" value="true">
<embed type="application/x-mplayer2" pluginspage = "http://www.microsoft.com/Windows/MediaPlayer/" src="' . $this->getWvxUri($program) . '"  name="MediaPlayer1" width="320" height="305" uiMode="full" AutoStart="0">
</embed></object>';
        return $embeded;
    }
    function makeSwitchLanguage ($languages = null)
    {
        //Zend_Debug::dump($languages);
        if ($languages === null)
            $languages = $this->getLangues();
        $lang_libelle = array();
        $libelle = array();
        $libelle_other = array();
        $liste = "<ul>";
        $other = array();
        for ($i = 0; $i < sizeof($languages); $i ++) {
            if ($languages[$i]["lcid"] != "2057" && $languages[$i]["lcid"] != "1036" && $languages[$i]["lcid"] != "1033") {
                $libelle[] = $languages[$i]["libelle"];
                $lang_libelle[] = array("libelle" => $languages[$i]["libelle"] , "lcid" => $languages[$i]["lcid"]);
            } else {
                $other[] = array("libelle" => $languages[$i]["libelle"] , "lcid" => $languages[$i]["lcid"]);
                $libelle_other[] = $languages[$i]["libelle"];
            }
        }
        array_multisort($libelle, $lang_libelle);
        array_multisort($libelle_other, SORT_DESC, $other);
        $lang_libelle = array_merge($other, $lang_libelle);
        // On tri par ordre alphapétique
        for ($i = 0; $i < sizeof($lang_libelle); $i ++) {
            if (is_file(ROOT . "/www/themes/system/pics/lcid/" . $lang_libelle[$i]["lcid"] . ".gif"))
                $img = '<img border="0" src="' . BASE_URL . 'themes/system/pics/lcid/' . $lang_libelle[$i]["lcid"] . '.gif" alt="flag"/>';
            else
                $img = "";
            $libelle = $lang_libelle[$i]["libelle"];
            $lcid = $lang_libelle[$i]["lcid"];
            $lang_libelle[$i]["pic"] = $img;
            $lang_libelle[$i]["js"] = 'setLangueByLCID(\'' . $lcid . '\');current_lcid=' . $lcid . ';';
            $liste .= '<li ><label><input class="lang_' . $lcid . '" type="radio" name="languages" value="' . $lcid . '" onclick="setLangueByLCID(\'' . $lcid . '\');current_lcid=' . $lcid . ';" alt="flag ' . $libelle . '"/>' . $img . '&nbsp;<span class="libelle_langue">' . $libelle . '</span></label></li>';
        }
        $liste .= "</ul>";
        return $liste;
    }
}