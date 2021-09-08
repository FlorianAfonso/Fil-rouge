<?php
require "header.php" ;

require "connexion_bdd.php" ;
$db = connexionBase() ;
$login = $_SESSION["login"] ;
$requete = "SELECT * FROM customers WHERE cus_login = '$login'" ;
$result = $db->prepare($requete) ;
$result->execute() ;
?>

<br><br>



<?php
    while ($row = $result->fetch(PDO::FETCH_OBJ))
    {
        echo '<div class="card text-center border-light pt-1"' ;
            echo '<div class="card-body">' ;
              echo '<h4 class="card-title">' . $row -> cus_login . '</h4>' ;
              echo '<p>RÔLE : ' . $_SESSION["role"] . '</p>' ;
              echo '<p>NOM : ' . $row->cus_lastname . '</p>' ;
              echo '<p>PRÉNOM : ' . $row->cus_firstname . '</p>' ;
              echo '<p>MAIL : ' . $row->cus_email . '</p>' ;
              echo '<p>Date de création du compte : ' . $row->cus_date_created . '</p>' ;
              echo '<p class="card-text"><small class="text-muted">Dernière connexion le : ' . $row->cus_date_updated . '</small></p>' ;
            echo '</div>' ;
        echo '</div>' ;
    }
?>
<br><br>
<div class="container">


</div>
<br>


<?php require "footer.php" ;?>