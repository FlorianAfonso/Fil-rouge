<?php
session_start() ;
require "connexion_bdd.php" ;
$db = connexionBase() ;
$wequete = "INSERT INTO customers (cus_login, cus_password, cus_lastname, cus_firstname, cus_date_birth, cus_email, cus_phone_number, cus_address, cus_city, cus_zipcode, cus_country, cus_date_created)
            VALUES (:login, :mdp, :nom, :prenom, :ddn, :mail, :phone, :address, :city, :zip, :country, NOW())" ;
$requete = $db ->prepare($wequete) ;
$requete -> bindValue(":login", $_POST["pseudo"]) ;
$mdp = password_hash($_POST["mdp"], PASSWORD_DEFAULT) ;
$requete -> bindValue(":mdp", $mdp) ;
$requete -> bindValue(":nom", $_POST["nom"]) ;
$requete -> bindValue(":prenom", $_POST["prenom"]) ;
$requete -> bindValue(":ddn", $_POST["ddn"]) ;
$requete -> bindValue(":mail", $_POST["mail"]) ;
$requete -> bindValue(":phone", $_POST["phone"]) ;
$requete -> bindValue(":address", $_POST["address"]) ;
$requete -> bindValue(":city", $_POST["city"]) ;
$requete -> bindValue(":zip", $_POST["zip"]) ;
$requete -> bindValue(":country", $_POST["country"]) ;


$erreurs = "" ;

// PSEUDO
if (!preg_match("/^[\s\S]{1,30}$/", $_POST["pseudo"]))
{
    $erreurs .= "&epseu" ;
    header ("Location: inscription.php?$erreurs") ;
}

//MOT DE PASSE
if (!preg_match("/^[\s\S]{1,60}$/", $_POST["mdp"]))
{
    $erreurs .= "&emdp" ;
    header ("Location: inscription.php?$erreurs") ;
}


// NOM
if (!preg_match("/^[a-zA-Zéèê]{1,30}$/", $_POST["nom"]))
{
    $erreurs .= "&enom" ;
    header ("Location: inscription.php?$erreurs") ;
}

// PRENOM
if (!preg_match("/^[a-zA-Zéèê]{1,30}$/", $_POST["prenom"]))
{
    $erreurs .= "&epre" ;
    header ("Location: inscription.php?$erreurs") ;
}

//DATE DE NAISSANCE
if (empty($_POST["ddn"]))
{
    $erreurs .= "&eddn" ;
    header ("Location: inscription.php?$erreurs") ;
}

// EMAIL
if (!preg_match("/^[a-z0-9.-]+@[a-z0-9.-]{2,}.[a-z]{2,4}$/", $_POST["mail"]))
{
    $erreurs .= "&email" ;
    header ("Location: inscription.php?$erreurs") ;
}

// PHONE NUMBER
if (!preg_match("/^[0-9]{10}$/", $_POST["phone"]))
{
    $erreurs .= "&epho" ;
    header ("Location: inscription.php?$erreurs") ;
}

// ADRESSE
if (!preg_match("/^[\s\S]{1,255}$/", $_POST["address"]))
{
    $erreurs .= "&eadd" ;
    header ("Location: inscription.php?$erreurs") ;
}

//VILLE
if (!preg_match("/^[\s\S]{1,30}$/", $_POST["city"]))
{
    $erreurs .= "&ecity" ;
    header ("Location: inscription.php?$erreurs") ;
}

//ZIPCODE
if (!preg_match("/^[0-9]{5}$/", $_POST["zip"]))
{
    $erreurs .= "&ezip" ;
    header ("Location: inscription.php?$erreurs") ;
}

//COUNTRY
if (!preg_match("/^[\s\S]{1,30}$/", $_POST["country"]))
{
    $erreurs .= "&ecoun" ;
    header ("Location: inscription.php?$erreurs") ;
}

else
{
    $_SESSION["login"] = $_POST["pseudo"] ;
    $_SESSION["mdp"] = $_POST["mdp"] ;
    $requete->execute();
    $resultat = $requete->fetch(PDO::FETCH_OBJ);
    $requete->closeCursor();
    header ("Location: index.php") ;
    exit ;
}

?>