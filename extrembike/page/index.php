<!DOCTYPE html>
<html lang="fr" class="mt-3">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Extrem'Bike</title>
</head>
<body>
    <?php
    require "header.php";
    ?>

<br> <br>
<?php
echo $_SESSION["login"] ;
echo $_SESSION["mdp"] ;
?>
    <?php
    require "footer.php";
    ?>

</body>
</html>