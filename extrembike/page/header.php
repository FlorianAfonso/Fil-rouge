<?php session_start() ; ?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Extrem'Bike</title>
</head>
<body>

<div class="container">
<img class="img-fluid img-responsive w-80" src="vtt_photos/accueil.png" alt="Image">
<nav class="navbar navbar-expand-lg navbar-light bg-info">
  <a class="navbar-brand text-light" href="index.php"><b><i>Extrem'Bike</i></b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link text-light" href="index.php"><i class="fas fa-home"></i> Accueil<span class="sr-only"></span></a>
      </li>
      <li class="nav-item">
      </li>
      <li class="nav-item">
        <a class="nav-link text-light" href="liste.php"><i class="fas fa-shopping-cart"></i> Shop</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-light" href="contact.php"><i class="far fa-address-book"></i> Contact</a>
      </li>

      
      <?php if (isset($_SESSION["login"])) : ?>

<a class="btn btn-info mr-1" href="profil.php"><i class="fas fa-portrait"></i> Profil</a>
<a class="btn btn-info ml-1" href="deconnexion.php"><i class="fas fa-sign-out-alt"></i> Deconnexion</a>

<?php else : ?>
  <div class="dropdown">
  <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
  <i class="fas fa-user-circle"></i> Mon compte 
  </button>
  <div class="dropdown-menu bg-light">
  <form class="px-4 py-3 " action="verif_connexion.php" method="POST">
    <div class="form-group">
      <label for="pseudo" class="text-info">Identifiant</label>
      <input type="text" class="form-control text-info" id="pseudo" name="pseudo" placeholder="user_name">
    </div>
    <div class="form-group">
      <label for="mdp" class="text-info">Mot de passe</label>
      <input type="password" class="form-control text-info <?php if (isset($_GET['emdp'])) { echo 'border border-danger' ; }?>" id="mdp" name="mdp" placeholder="password">
      <?php if (isset($_GET['emdp'])) { echo '<span class=" text-danger"><center>Mot de passe erroné</center></span>' ; }?>
    </div>
    <div class="form-group">
      <div class="form-check">
        <input type="checkbox" class="form-check-input" id="dropdownCheck">
        <label class="form-check-label text-info" for="dropdownCheck">
          Se souvenir de moi
        </label>
      </div>
    </div>
    <button type="submit" name="submit" class="btn btn-info text-light">Se connecter</button>
  </form>
  <div class="dropdown-divider"></div>
  <a class="dropdown-item bg-light text-info" href="inscription.php">Nouveau ? <u><b>Inscris toi !</b></u></a>
  <a class="dropdown-item bg-light text-info" href="mdpforgot.php">Mot de passe oublié ?</a>
</div>
</div>
 <?php endif ; ?>

    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mx-sm-1" type="search" placeholder="J'ai besoin de..." aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><i class="fas fa-biking"></i></button>
    </form>
  </div>
</nav>
</div>
<script src="https://kit.fontawesome.com/08f7104fd7.js" crossorigin="anonymous"></script>

