<!-- Insertion du header et connexion a la BDD -->
<?php
require "header.php";
require "connexion_bdd.php"
$db=connexionBase();
$pro_id=$_GET["pro_id"];
$requete="SELECT * FROM products WHERE pro_id=$pro_id";
?>



<?php
require "footer.php";
?>