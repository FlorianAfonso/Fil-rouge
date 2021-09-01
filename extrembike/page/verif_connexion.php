<?php 
session_start() ;

if (isset($_POST["submit"]))
{
    $login = $_POST["pseudo"] ;
    $mdp = $_POST["mdp"] ;

    require "connexion_bdd.php" ;
    $db = connexionBase();

    $requete = "SELECT * FROM customers WHERE cus_login = '$login'" ;
    $result =$db->prepare($requete) ;
    $result->execute() ;

    if ($result->rowCount() > 0)
    {
        $data = $result->fetchAll() ;
        if (password_verify($mdp, $data[0]["cus_password"]))
        {
            $_SESSION["login"] = $login ;
            $_SESSION["role"] = "admin" ;
            header ("Location: index.php") ;
            exit ;
        }
        else
        {
            header ("Location: inscription.php") ;
            exit ;
        }
    }
    else
    {
        header ("Location: inscription.php") ;
        exit ;
    }
}
?>