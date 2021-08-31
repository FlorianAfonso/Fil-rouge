<!DOCTYPE html>
<html lang="fr" class="mt-3">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Extrem'Bike</title>
</head>
<body class="text-info">
    <?php
    require "header.php";
    ?>

<br> <br>

<div class="container">


<h1 >Inscription</h1>
<form action="verif_inscription.php" method="POST" id="inscription">
    <p><span class="text-danger">* Information indispensable</span>
        <legend>Vos coordonnées</legend>

        <label for="pseudo">Pseudo <span class="text-danger">* </span>:</label>
        <input type="text" id="pseudo" name="pseudo" class="form-control <?php if (isset($_GET["epseu"])) {echo "border border-danger" ;} ?>">
        <?php if (isset($_GET["epseu"])) {echo "<span class='text-danger'>Veuillez indiquez un pseudo valide</span>" ;} ?>

        <br>
        <label for="mdp">Mot de passe <span class="text-danger">* </span> :</label>
        <input type="text" id="mdp" name="mdp" class="form-control <?php if (isset($_GET["emdp"])) {echo "border border-danger" ;} ?>">
        <?php if (isset($_GET["emdp"])) {echo "<span class='text-danger'>Veuillez indiquez un mot de passe valide</span>" ;} ?>


        <br>
        <label for="nom">Nom<span class="text-danger">* </span>:</label>
        <input type="text" id="nom" name="nom" class="form-control <?php if (isset($_GET["enom"])) {echo "border border-danger" ;} ?>">
        <?php if (isset($_GET["enom"])) {echo "<span class='text-danger'>Veuillez indiquez un nom valide</span>" ;} ?>
        <br>

        <label for="prenom">Prénom <span class="text-danger">* </span> :</label>
        <input type="text" id="prenom" name="prenom" class="form-control <?php if (isset($_GET["epre"])) {echo "border border-danger" ;} ?>">
        <?php if (isset($_GET["epre"])) {echo "<span class='text-danger'>Veuillez indiquez un prénom valide</span>" ;} ?>

        <br>
        <label for="ddn">Date de naissance<span class="text-danger">* </span>:</label>
        <input type="date" id="ddn" name="ddn" value="2011-07-22" class="form-control text-info <?php if (isset($_GET["eddn"])) {echo "border border-danger" ;} ?>">
        <?php if (isset($_GET["eddn"])) {echo "<span class='text-danger'>Veuillez indiquez une date de naissance valide</span>" ;} ?>
        <br>

        <label for="mail">Email<span class="text-danger">* </span>:</label>
        <input type="email" id="mail" name="mail" class="form-control <?php if (isset($_GET["email"])) {echo "border border-danger" ;} ?>">
        <?php if (isset($_GET["email"])) {echo "<span class='text-danger'>Veuillez indiquez un email valide</span>" ;} ?>
        <br>

        <label for="phone">Téléphone<span class="text-danger">* </span>:</label>
        <input type="phone" id="phone" name="phone" class="form-control <?php if (isset($_GET["epho"])) {echo "border border-danger" ;} ?>">
        <?php if (isset($_GET["epho"])) {echo "<span class='text-danger'>Veuillez indiquez un numéro de téléphone valide</span>" ;} ?>
        <br>

        <label for="adress">Adresse :</label>
        <input type="text" id="adress" name="adress" class="form-control <?php if (isset($_GET["eadd"])) {echo "border border-danger" ;} ?>"> 
        <?php if (isset($_GET["eadd"])) {echo "<span class='text-danger'>Veuillez indiquez une adresse valide</span>" ;} ?>
        <br>
    
        <label for="city">Ville :</label>
        <input type="text" id="city" name="city" class="form-control <?php if (isset($_GET["ecity"])) {echo "border border-danger" ;} ?>"> 
        <?php if (isset($_GET["ecity"])) {echo "<span class='text-danger'>Veuillez indiquez une ville valide</span>" ;} ?>
        <br>

        <label for="zip">Code postale<span class="text-danger">* </span>:</label>
        <input type="text" id="zip" name="zip" class="form-control <?php if (isset($_GET["ezip"])) {echo "border border-danger" ;} ?>"> 
        <?php if (isset($_GET["ezip"])) {echo "<span class='text-danger'>Veuillez indiquez un code postale valide</span>" ;} ?>
        <br>

        <label for="country">Pays<span class="text-danger">* </span>:</label>
        <input type="text" id="country" name="country" class="form-control <?php if (isset($_GET["ecoun"])) {echo "border border-danger" ;} ?>">
        <?php if (isset($_GET["ecoun"])) {echo "<span class='text-danger'>Veuillez indiquez un pays valide</span>" ;} ?>
        <br> 

        <button class="btn btn-info" type="submit">S'inscrire</button> 
        
    <?php
    require "footer.php";
    ?>

    </fieldset>


   

</body>
</html