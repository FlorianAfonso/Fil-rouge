<?php 
require "header.php";
require "connexion_bdd.php";
$db=connexionBase();
$categorie = $db->prepare("SELECT cat_id , cat_name FROM categories ORDER BY cat_name");
$categorie -> execute() ;

?>

<form class="form-group" action="verif_ajout.php" method="POST" enctype="multipart/form-data">

<div class="container text-info">

<div class="form-group">
        <label for="photo">Photo*</label><br>
        <input type="file" <?php if (isset($_GET['ephoto'])) { echo 'class="border border-danger"'; } ?> id="photo" name="photo"><br>
        <?php
        if (isset($_GET['ephoto'])) { echo '<i>Le format de l\'image doit être en .jpg, .jpeg ou .png.</i>'; }
        ?>
    </div>

    <!-- Référence -->
    <label for="ref">Référence</label>
    <input type="text" class="form-control <?php if (isset($_GET['eref'])) { echo 'border border-danger'; } ?>" id="ref" name="ref" placeholder="Ex : BMC1 (max. 10 caractères)">
    <?php if (isset($_GET['eref'])) { echo '<i>La référence n\'a pas été renseignée, comporte des caractères spéciaux, ou comporte trop de caractères.</i> <br>'; } ?>

    <br>

    <!-- Nom du VTT -->
    <label for="libelle">Nom VTT</label>
    <input type="text" class="form-control <?php if (isset($_GET['elib'])) { echo 'border border-danger'; } ?>" id="Libelle" name="libelle" placeholder="Ex : Nom du VTT (max. 200 caractères)">
    <?php if (isset($_GET['elib'])) { echo '<i>Le nom n\'a pas été renseignée, comporte des caractères spéciaux ou des chiffres ou comporte trop de caractères.</i> <br>'; } ?>

    <br>

        <!-- Catégorie --> 
    
        <div class="form-group">
            <label for="categorie">Catégorie*</label>
            <select id="categorie" name="categorie" class="form-control <?php if (isset($_GET['ecat'])) {echo 'border border-danger' ; } ?>">
                <option value="" selected disabled>--</option>
        <?php

            while ($rowsCategorie = $categorie->fetch(PDO::FETCH_OBJ)):
        ?>
        <option value="<?php echo $rowsCategorie->cat_id; ?>">
        <?php echo $rowsCategorie->cat_name; ?>
        </option>
        <?php
            endwhile;

            $categorie->closeCursor(); 
        ?>
        </select>
        <?php if (isset($_GET['ecat'])) {echo '<i>Veuillez séléctionner une catégorie.</i> <br>' ; } ?>
        </div>

    <br>
    
    <!-- Description -->
    <label for="description">Description</label>
    <textarea class="form-control <?php if (isset($_GET['edesc'])) { echo 'border border-danger'; } ?> " name="description" id="description" placeholder="Ex : Cadre / Fourche / roue .... (max. 1000 caractères)"></textarea>
    <?php if (isset($_GET['edesc'])) { echo '<i>La description n\'a pas été renseignée ou comporte trop de caractères.</i> <br>'; } ?>
    <br>

    <!-- Prix -->
    <label for="prix">Prix</label>
    <input type="text" class="form-control <?php if (isset($_GET['eprix'])) { echo 'border border-danger'; } ?>" id="prix" name="prix" placeholder="Ex : 3520 (max. 6 caractères)">
    <?php if (isset($_GET['eprix'])) { echo '<i>Le prix n\'a pas été renseignée, comporte des caractères spéciaux ou des lettres, ou comporte trop de caractères.</i> <br>'; } ?>

    <br>

    <!-- Stock -->
    <label for="stock">Stock</label>
    <input type="text" class="form-control <?php if (isset($_GET['estock'])) { echo 'border border-danger'; } ?>" id="stock" name="stock" placeholer="Ex : 2 (max. 11 caractères)">
    <?php if (isset($_GET['estock'])) { echo '<i>Le stock n\'a pas été renseignée, comporte des caractères spéciaux ou des lettres, ou comporte trop de caractères.</i> <br>'; } ?>
    
    <!-- Couleur -->
    <br>
    <label for="couleur">Couleur</label>
    <input type="text" class="form-control <?php if (isset($_GET['ecolor'])) { echo 'border border-danger'; } ?>" id="couleur" name="couleur" placeholder="Ex : Pourpre (max. 30 caractères)">
    <?php if (isset($_GET['ecolor'])) { echo '<i>La couleur n\'a pas été renseignée, comporte des caractères spéciaux ou des chiffres ou comporte trop de caractères.</i> <br>'; } ?>


    <br><br>

    <div class="text-center">
        <button type="submit" class="btn btn-info"> Enregistrer</button>
        <a href="liste.php" class="btn btn-info"> Annuler</a>
    </div>
    
        </form>

<br><br>
<?php
require "footer.php";
?>