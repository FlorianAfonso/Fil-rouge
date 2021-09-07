<?php 

require "connexion_bdd.php" ;
$db = connexionBase() ;

$wequete = "INSERT INTO products (pro_name, pro_price, pro_reference, pro_stock, pro_color, pro_description, pro_date_created, pro_cat_id)
            VALUES (:libelle, :prix, :reference, :stock, :couleur, :description, NOW(), :categorie)" ;
$requete = $db -> prepare($wequete) ;
$requete->bindValue(":categorie", $_POST["categorie"]) ;
$requete->bindValue(":reference", $_POST["ref"]) ;
$requete->bindValue(":description", $_POST["description"]) ;
$requete->bindValue(":prix", $_POST["prix"]) ;
$requete->bindValue(":stock", $_POST["stock"]) ;
$requete->bindValue(":couleur", $_POST["couleur"]) ;
$requete->bindValue(":libelle", $_POST["libelle"]) ;


$erreurs = "" ;

$aMimeTypes = array('image/jpg', 'image/jpeg');            
$finfo = finfo_open(FILEINFO_MIME_TYPE);            
$mimeType = finfo_file($finfo, $_FILES['photo']['tmp_name']);           
finfo_close($finfo);  

//Photo
if (!in_array($mimeType, $aMimeTypes))            
{            
    $erreurs .= '&ephoto';       
    header("Location: ajout_produit.php?" . $erreurs) ;          
} 

// Catégorie
if (empty($_POST["categorie"]))
{
    $erreurs .= "&ecat" ;            
    header("Location: ajout_produit.php?" . $erreurs) ;      
}

// Référence
if (!preg_match("/^[a-zA-Z-_0-9]{1,10}$/", $_POST["ref"]))
{
    $erreurs .= "&eref";            
    header("Location: ajout_produit.php?" . $erreurs) ;      
}

// Libellé
if (!preg_match("/^[\s\S]{1,200}$/", $_POST["libelle"]))
{
    $erreurs .= "&elib";            
    header("Location: ajout_produit.php?" . $erreurs) ;      
}

// Description
if (!preg_match("/^[\s\S]{0,10000}$/", $_POST["description"]))
{
    $erreurs .= "&desc";            
    header("Location: ajout_produit.php?" . $erreurs) ;      
}

// Prix
if (!preg_match("/^[0-9]{1,9}$/", $_POST["prix"]))
{
    $erreurs .= "&eprix";            
    header("Location: ajout_produit.php?" . $erreurs) ;      
}

//Stock
if (!preg_match("/^[0-9]{1,11}$/", $_POST["stock"]))
{
    $erreurs .= "&estock";            
    header("Location: ajout_produit.php?" . $erreurs) ;      
}

// Couleur
if (!preg_match("/^[a-zA-Z]{0,30}$/", $_POST["couleur"]))
{
    $erreurs .= "&ecolor";            
    header("Location: ajout_produit.php?" . $erreurs) ;      
}

if ($erreurs != NULL)
{
    exit;
}

else
    {
        if (! $requete -> execute()) { var_dump( $requete->errorInfo() ) ; }
        


        $requete -> closeCursor() ;
        $requete = $db->prepare('SELECT pro_id FROM products WHERE pro_reference = ?');            
        $requete->bindValue(1, $_POST['ref']);            
        $requete->execute();         
        $resultat = $requete->fetch(PDO::FETCH_OBJ);            
        $requete->closeCursor();  
                     
        move_uploaded_file($_FILES['photo']['tmp_name'], "vtt_photos/$resultat->pro_id.jpg");
        header("Location: liste.php") ;
        exit ;
    }
?>