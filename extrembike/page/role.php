<?php
require "header.php" ;
require "connexion_bdd.php" ;
$cus_id = $_GET["cus_id"] ;
$db = connexionBase();
$requete = "SELECT * FROM customers WHERE cus_id = " . $cus_id ;
$result = $db -> prepare($requete) ;
$result->execute() ;
$cus = $result -> fetch(PDO::FETCH_OBJ) ;
?>
<br><br>

<div class="container">

<form action="verif_modif_admin.php" method="POST">
    <div class="form-group">
        <label for="id">ID</label>
        <input class="form-control" name="id" id="id" value="<?php echo $cus->cus_id ; ?>" readonly>
    </div>

    <div class="form-group">
        <label for="nom">Nom</label>
        <input class="form-control" name="nom" id="nom" value="<?php echo $cus->cus_lastname ; ?>" readonly>
    </div>

    <div class="form-group">
        <label for="prenom">Prénom</label>
        <input class="form-control" name="prenom" id="prenom" value="<?php echo $cus->cus_firstname; ?>" readonly>
    </div>

    <div class="form-group">
        <label for="login">Login</label>
        <input class="form-control" name="login" id="login" value="<?php echo $cus->cus_login ; ?>" readonly>
    </div>

    <div class="form-group">
        <label for="mail">Email</label>
        <input class="form-control" name="mail" id="mail" value="<?php echo $cus->cus_email ; ?>" readonly>
    </div>

    <div class="form-group">
        <label for="create">Date de création du compte</label>
        <input class="form-control" name="create" id="create" value="<?php echo $cus->cus_date_created ; ?>" readonly>
    </div>

    <div class="form-group">
        <label for="last">Date de dernière connexion</label>
        <input class="form-control" name="last" id="last" value="<?php echo $cus->cus_date_updated ; ?>" readonly>
    </div>

    <div class="form-group">
        <label for="role">Rôle</label>
        <input class="form-control <?php if(isset($_GET["error"])) {echo 'border border-danger' ;}?>" name="role" id="role" value="<?php echo $cus->cus_role ; ?>">
        <?php if(isset($_GET["error"])) {echo 'Le rôle n\'est pas bon.' ;}?>
    </div>
    <br>
    <button class="btn btn-info" type="submit">Enregistrer</button> <button class="btn btn-info">Annuler</button>
    <br>


</form>

</div>

<br><br>

<?php require "footer.php" ; ?>