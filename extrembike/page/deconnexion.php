<?php
session_start() ;
require "connexion_bdd.php" ;
$db = connexionBase () ;
$login = $_SESSION["login"] ;
$wequete = "UPDATE customers SET cus_date_updated = NOW() WHERE cus_login = '$login'" ;
$requete = $db -> prepare($wequete) ;
$requete->execute() ;
$requete->closeCursor() ;
$_SESSION = array() ;
session_destroy() ;
header ("Location: index.php") ;
exit ;
?>