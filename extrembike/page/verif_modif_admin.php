<?php
session_start() ;
require "connexion_bdd.php" ;
$db = connexionBase() ;
$wequete = "UPDATE customers SET cus_lastname = :nom, cus_lastname = :prenom, cus_login = :login, cus_email = :mail, cus_role = :role WHERE cus_id = :id" ;
$requete = $db -> prepare($wequete) ;
$requete->bindValue(":id", $_POST["id"]) ;
$requete->bindValue(":nom", $_POST["nom"]) ;
$requete->bindValue(":prenom", $_POST["prenom"]) ;
$requete->bindValue(":login", $_POST["login"]) ;
$requete->bindValue(":mail", $_POST["mail"]) ;
$requete->bindValue(":role", $_POST["role"]) ;
$erreurs = "" ;

if (!preg_match("/^[\s\S]{1,50}$/", $_POST["role"]))
{
    $erreurs .= "&error" ;
    header ('Location: modif_admin.php?user_id=' . $_POST["id"] . $erreurs) ;
}

else
{
    $requete->execute() ;
    $requete->closeCursor() ;
    header ("Location: index.php") ;
    exit ;
}

?>
