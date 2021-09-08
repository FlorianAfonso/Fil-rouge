<?php
require "header.php" ;
require "connexion_bdd.php" ;
$db = connexionBase() ;
$pro_id = $_GET ["pro_id"] ;
?>
<div class="container">
<br><br>
<center><h3 class="text-info">Confirmer la suppression du produit ?</h3></center>

<br>

<form action="verif_delete.php?pro_id=<?php echo $pro_id ; ?>" method="POST">


       <center> <button type="submit" class="btn btn-success">Oui</button>  <a href="liste.php" class="btn btn-danger">Non</a> </center>









</div>
<br><br>
<?php require "footer.php" ; ?>