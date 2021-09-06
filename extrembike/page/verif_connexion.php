<?php 
session_start() ;

$erreur ="";

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
            $result->execute() ;
            $customers = $result->fetch(PDO::FETCH_OBJ) ;
            $_SESSION["role"] = $customers->cus_role ;
            header ("Location: index.php") ;
            exit ;
        }
        else
        {
            $erreur.="&emdp" ; 
            header ("Location: index.php?$erreur") ;
        }
    }
    else
    {
        $erreur.="&emdp" ; 
        header ("Location: index.php?$erreur") ;
    }
}
?>