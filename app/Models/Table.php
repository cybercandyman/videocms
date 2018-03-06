<?php
require_once MODULE_DIRECTORY . "/api/models/datacontainer.php";
class Model_Table extends Model_Api
{
    private $authorizedTable = array("enum_genre");
    public function getTable ($tableName, $lang="en")
    {
    	require_once MODULE_DIRECTORY.'/../ViewsHelpers/ContentTable.php';

    	$strSQL = "SELECT id,libelle as value,ref_text,parent from $tableName ORDER BY value ASC";
    	$strSQL = "SELECT  tor.id,
              CASE WHEN tt.value is null THEN tor.libelle
              ELSE tt.value
              END  as value,
              tor.libelle as libelle_origine, tor.parent
              FROM $tableName tor
              LEFT OUTER JOIN translations tt on tor.id = tt.ref_num AND tt.lang = '$lang' AND table_name = '$tableName'
              ORDER BY 2 ASC";
              
        return  $this->_db->fetchAll($strSQL);
    }
    private function getTableGenre ($lang)
    {}
}