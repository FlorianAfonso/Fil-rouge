<!-- insertion du header -->
<?php
require "header.php";
require "connexion_bdd.php";
$db=connexionBase();
$requete="SELECT * FROM products WHERE pro_cat_id=5";
$result=$db->prepare($requete);
$result->closeCursor();
$result->execute();

if (!$result)
{
    $tableauErreur = $db -> errorInfo();
    echo $tableauErreur[2] ;
    die("Erreur dans la requête.") ;
}

if ($result -> rowCount() == 0)
{
    //Pas d'enregistrement
    die("La table est vide.") ;
}

?>

 <div class="container text-center">
   <div class="row justify-content-center">
     
     <?php while($row=$result->fetch(PDO::FETCH_OBJ)) : ?>
      
        <div class="col-3 mb-2">

            <div class="card px-2" style="width: 18rem;">
              <img class="card-img-top" src="vtt_photos/<?php echo $row->pro_picture_file_name ; ?>.jpg" alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title"><?php echo $row->pro_name ; ?></h5>
                <p class="card-text"><?php echo $row->pro_color ; ?></p>
                <p class="card-text"><b><?php echo $row->pro_price ; ?> €</b></p>
                <a href="details.php?pro_id=<?php echo $row->pro_id ; ?>" class="btn btn-info"><i class="fas fa-info-circle"></i></a> <a href="panier.php" class="btn btn-info"><i class="fas fa-shopping-cart"></i></a>
              </div>
            </div>

      

      </div>
<?php endwhile ; ?>

  </div>
  <br>
  <a class="btn btn-info" href="liste.php"><i class="fas fa-arrow-left"> Liste des marques</i></a>
</div>

<br>

<?php
require "footer.php";
?>