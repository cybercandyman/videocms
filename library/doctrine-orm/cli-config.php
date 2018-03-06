<?php
define ( "APPLICATION_ENV", "testing" );
define ( "ROOT", realpath ( "." ) . "/../../" ); // Ecraser valeur de ROOT défini dans constants.php


require_once (realpath ( "." ) . "/../../app/constants.php");
require_once (realpath ( "." ) . "/../../library/ZN/Application/Resource/Doctrine.php");

$ressource = new ZN_Application_Resource_Doctrine ();
$em = $ressource->init ();



$helperSet = new \Symfony\Component\Console\Helper\HelperSet ( array ('em' => new \Doctrine\ORM\Tools\Console\Helper\EntityManagerHelper ( $ressource->getEntityManager () ) ) );
