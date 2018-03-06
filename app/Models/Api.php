<?php
class Model_Api extends ZN_Model_Model
{
    /**
     * Item information 
     * @var array
     */
    public $_data;
    /**
     * @return the $_data
     */
    public function get_data ()
    {
        return $this->_data;
    }
    /**
     * @param $_data the $_data to set
     */
    public function set_data ($_data)
    {
        $this->_data = $_data;
    }
    /**
     * @desc Magic function to get properties from the array data of the object
     * @param unknown_type $key
     */
    public function __get ($key)
    {
        if (isset($this->_data["details"]) && array_key_exists($key, $this->_data["details"])) {
            return $this->_data["details"][$key]["value"];
        }
        if (array_key_exists($key, $this->_data)) {
            return $this->_data[$key];
        }
        return null;
    }
    protected function set_attrib ($attribs)
    {
        if ($attribs != null && is_array($attribs)) {
            foreach ($attribs as $key => $value) {
                $this->$key = $value;
            }
        }
    }
    /**
     * Construct an array of $className based on $array
     * @param $array
     * @param $className
     */
    protected function setCollection ($array, $className, $attribs = null)
    {
        $tmpArray = array();
        foreach ($array as $item) {
            $object = new $className();
            $object->set_data($item);
            $object->set_attrib($attribs);
            $tmpArray[] = $object;
        }
        return $tmpArray;
    }
    /**
     * Convert relative url to absolute
     * @param string $url
     */
    public static function relativeToAbsolute ($url)
    {
        $config = Zend_Registry::get("config");
        $host = $_SERVER["HTTP_HOST"];
        $host = $_SERVER["HTTP_HOST"];
        $newUrl = preg_match("#^/#", $url) ? "http://" . $host . preg_replace("#^../..#", "", $url) : $url;
        return $newUrl;
    }
    /**
     * @desc Return idpublication by key
     * @param $key
     */
    protected function getIdPublication ($key)
    {
        $pub = new publication();
        $idpub = $pub->getIdPublicationByKey($key);
        if ($idpub)
            return $idpub;
        else
            throw new ZN_Exception(new Zend_Exception("Publication not found"));
    }
    /**
     * @desc Return the idview by viewcode
     * @param $idpub
     * @param $viewcode
     */
    protected function getIdView ($idpub, $viewcode = "default")
    {
        $viewcode = $viewcode == null ? "default" : $viewcode;
        $pub = new publication();
        $idview = $pub->getIdView($idpub, $viewcode);
        if ($idview)
            return $idview;
        else
            throw new ZN_Exception(new Zend_Exception("Idview for $viewcode not found"));
    }
}