<?php 
session_start();

if(isset($_SESSION['userID'])) {
  header('location: view/pagina_principal.php');
    }else{
        header('location: view/login_trans.html');
    }
      
?>