<?php 
session_start();

if(isset($_SESSION['userID'])) {
  if($_SESSION['userTIPO']==5){
    header('location: view/pagina_principal_admin.php');
  }else if($_SESSION['userTIPO']==6){
  header('location: view/pagina_principal.php');
  }
    }else{
        header('location: view/login_trans.html');
    }
      
?>