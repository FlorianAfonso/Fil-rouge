<!-- Insertion du header et connexion a la BDD -->
<?php
require "header.php";
require "connexion_bdd.php"
?>


<?php
$pro_id=$_GET["pro_id"];

$DATABASE_HOST = 'localhost';
$DATABASE_NAME = 'extrem_bike';
$DATABASE_USER = 'root';
$DATABASE_PASS = '';

try
{
    $db = new PDO('mysql:host=' . $DATABASE_HOST . ';dbname=' . $DATABASE_NAME . ';charset=utf8', $DATABASE_USER, $DATABASE_PASS);
    $answer = $db->query("SELECT * FROM products WHERE pro_id=$pro_id");
    $row=$answer->FETCH(PDO::FETCH_OBJ);
} 
catch (PDOException $exception) 
{
    echo $exception->getMessage() . "<br>";
    die();
}
?>

<img src="vtt_photos/<?php echo $pro_id . '.jpg' ?>" class="img-fluid"><br>
                     <?php echo nl2br($row->pro_description); ?>


<?php
require "footer.php";
?>