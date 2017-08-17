<?php
require("../db/MySQLDAO.php");
$config = parse_ini_file('../../../SwiftPhp.ini');

$returnValue = array();
if(empty($_REQUEST["nombreAgencia"]))
{
    $returnValue["status"]="400";
    $returnValue["message"]="Missing required information";
    echo json_encode($returnValue);
    return;
}

$nombreAgencia = htmlentities($_REQUEST["nombreAgencia"]);



$dbhost = trim($config["dbhost"]);
$dbuser = trim($config["dbuser"]);
$dbpassword = trim($config["dbpassword"]);
$dbname = trim($config["dbname"]);
 
$dao = new MySQLDAO($dbhost, $dbuser, $dbpassword, $dbname);
$dao->openConnection();
$userDetails =$dao->getNombreAgencia($nombreAgencia);

if(empty($userDetails))
{
    $returnValue["status"]="403";
    $returnValue["message"]="Agencia no encontrada.";
    echo json_encode($returnValue);
    return;   
}



if(!empty($userDetails))
{
    $returnValue["status"]="200";
    $returnValue["nombre_agencia"] = $userDetails["nombre_agencia"];
    $returnValue["codigo_agencia"] = $userDetails["codigo_agencia"];
    $returnValue["direccion_agencia"] = $userDetails["direccion_agencia"];
    $returnValue["financiera"] = $userDetails["financiera"];
     $returnValue["auxilio_vial_mex"] = $userDetails["auxilio_vial_mex"];
     $returnValue["auxilio_vial_usa"] = $userDetails["auxilio_vial_usa"];
     $returnValue["app_store_agencia"] = $userDetails["app_store_agencia"];
       $returnValue["autos_nuevos"] = $userDetails["autos_nuevos"];
       $returnValue["email_taller"] = $userDetails["email_taller"];
       $returnValue["aseguradora_inbursa"] = $userDetails["aseguradora_inbursa"];
       $returnValue["aseguradora_atlas"] = $userDetails["aseguradora_atlas"];
       $returnValue["aseguradora_mapfre"] = $userDetails["aseguradora_mapfre"];
       $returnValue["aseguradora_assistance"] = $userDetails["aseguradora_assistance"];
       $returnValue["aseguradora_qualitas"] = $userDetails["aseguradora_qualitas"];
       $returnValue["aseguradora_gnp"] = $userDetails["aseguradora_gnp"];
    
    

} else {
    $returnValue["status"]="403";
    $returnValue["message"]="Agencia no encontrada";
    echo json_encode($returnValue);
    return;
}

$dao->closeConnection();

echo json_encode($returnValue);

?>
