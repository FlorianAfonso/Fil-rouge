<!-- PAGE VISIBLE QUE PAR MOI -->
<?php
// Appel des pages nécéssaires, connexion à la DB et création de la requête
require "header.php" ;
require "connexion_bdd.php" ;
$db = connexionBase() ; 
$requete = "SELECT * FROM customers" ;
$result = $db -> query($requete) ;

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

<div class="container">
<br><br>
<!-- Création du tableau où vont être les données des profils créer sur le site -->
<table class="table table-hover table-stripped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Ville</th>
            <th>Code postal</th>
            <th>Pays</th>
            <th>Email</th>
            <th>Login</th>
            <th>Date de création</th>
            <th>Date de dernière connexion</th>
            <th>ROLE</th>
        </tr>
    </thead>
    <tr>
        <!-- Scipt PHP qui va récuperer les données des profils dans la DB -->
        <?php
                while ($row = $result -> fetch(PDO::FETCH_OBJ))
                {
                echo "<tr>" ;
                    echo "<td>" . $row -> cus_id . "</td>" ;
                    echo "<td>" . $row -> cus_lastname . "</td>" ;
                    echo "<td>" . $row -> cus_firstname . "</td>" ;
                    echo "<td>" . $row -> cus_city . "</td>" ;
                    echo "<td>" . $row -> cus_zipcode . "</td>" ;
                    echo "<td>" . $row -> cus_country . "</td>" ;
                    echo "<td>" . $row -> cus_email . "</td>" ;
                    echo "<td><a class='text-warning' href='role.php?cus_id=" . $row -> cus_id . "'>" . $row -> cus_login . "</td>" ;
                    echo "<td>" . $row -> cus_date_created . "</td>" ;
                    echo "<td>" . $row -> cus_date_updated . "</td>" ;
                    echo "<td>" . $row -> cus_role . "</td>" ;
                }
        ?>
    </tr>
</table>

            </div>


<?php require "footer.php" ; ?>
