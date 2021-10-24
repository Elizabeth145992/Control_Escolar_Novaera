<?php 
session_start();

if(isset($_SESSION['userID'])) {
  if($_SESSION['userTIPO']==5){
    header('location: view/pagina_principal_admin.php');
  }else if($_SESSION['userTIPO']==6){
  header('location: view/pagina_principal.php');
  }else if($_SESSION['userTIPO']==1){
    header('location: view/pagina_principal_docente.php');
    }else if($_SESSION['userTIPO']==3){
      header('location: view/pagina_principal_padre.php');
      }else if($_SESSION['userTIPO']==4){
        header('location: view/pagina_principal_control.php');
        }else if($_SESSION['userTIPO']==2){
          header('location: view/pagina_principal_supervisor.php');
          }
    }else{
        header('location: view/login_trans.html');
    }
      
?>