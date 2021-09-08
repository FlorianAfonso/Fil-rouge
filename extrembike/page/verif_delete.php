<?php
require "connexion_bdd.php" ;
$db = connexionBase() ;
$pro_id = $_GET["pro_id"] ;
$requete = "DELETE FROM products WHERE pro_id = $pro_id" ;
$result = $db->prepare($requete) ;
$result -> execute() ;

header ("Location: index.php") ;
$result -> closeCursor() ;
exit ;
?>


