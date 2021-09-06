<!-- Insertion du header et connexion a la BDD -->
<?php
require "header.php";
require "connexion_bdd.php";
$db=connexionBase();
$pro_id=$_GET["pro_id"];
$requete="SELECT * FROM products WHERE pro_id=$pro_id";
$result=$db->prepare($requete);
$result->closeCursor();
$result->execute();
$produit=$result->fetch(PDO::FETCH_OBJ);
?>

<div class="container">
<center><img src="vtt_photos/<?php echo $produit->pro_picture_file_name;?>.jpg"></center>
<p><?php echo nl2br($produit->pro_description);?></p>

</div>
<br>
<?php
require "footer.php";
?>