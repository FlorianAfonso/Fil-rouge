
<?php
require "header.php"
?>
<br>

        <div class="container text-info">


            <h1 >Contacts</h1>
            <form action="http://bienvu.net/script.php" method="post" id="inscription">
                <p><span class="text-danger">* Information indispensable</span>
                    <legend>Vos coordonnées</legend>
                    <label for="name">Sexe<span class="text-danger">* </span>:</label>
                    <input type="radio" name="sexe" value="Male"> <span class="text-info" >Masculin </span>
                    <input type="radio" name="sexe" value="Female" > <span class="text-info">Feminin </span>

                    <br>
                    <label for="name">Nom<span class="text-danger">* </span>:</label>
                    <input type="text" id="nom" name="user_name" class="form-control">
                    <label for="prenom">Prénom <span class="text-danger">* </span> :</label>
                    <input type="text" id="prenom" name="user_prenom" class="form-control">

                    <br>

                    <label for="start">Date de naissance<span class="text-danger">* </span>:</label>
                    <input type="date" id="start" name="trip-start" value="2011-07-22" class="form-control text-info">
                    <br>
                    <label for="cp">Code postale<span class="text-danger">* </span>:</label>
                    <input type="text" id="cp" name="user_cp" class="form-control"> <br>

                    <label for="adress">Adresse :</label>
                    <input type="text" id="adress" name="user_adress" class="form-control"> <br>

                    <label for="ville">Ville :</label>
                    <input type="text" id="ville" name="user_ville" class="form-control"> <br>

                    <label for="mail">Email<span class="text-danger">* </span>:</label>
                    <input type="email" id="mail" name="user_mail" class="form-control">

                </fieldset>

                <fieldset>

                    <legen>Votre demande</legend>

                    <label for="demande">Sujet<span class="text-danger">* </span>:</label>
                    <select id="demande" class="form-control text-info">
                        <option value="Veuillez séléctionner un sujet" selected>Veuillez séléctionner un sujet</option>
                        <option value="Mes commandes">Mes commandes</option>
                        <option value="Questions sur un produit">Questions sur un produit</option>
                        <option value="Réclamation">Réclamation</option>
                        <option value="Autres">Autres</option>
                    </select><br>

                    <label>Votre question<span class="text-danger">* </span>:</label>
                    <textarea name="comentaires" rows="2" cols="20" class="form-control"></textarea>
                </fieldset>
                <br>
                <input type="checkbox" name="couleur3" value="Vert"><span class="text-danger">* </span>J'accepte le
                traitement informatique de ce formulaire
                <br><br>
                <input type="submit" value="Envoyer" class="form-control text-info">
                <br>
                <input type="reset" value="Annuler" class="form-control text-info">
                <br>
        </div>
        </form>
        <?php
        require "footer.php"
        ?>
