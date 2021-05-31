<?php
$email = $_GET['email'];
$password = $_GET['password'];
$AreaLavorativa =$_POST['AreaLavorativa'];
    $mysqli = new mysqli('localhost', 'root', '', 'elaborato_domanda_offerta_lavoro');
    $tab = $mysqli->query("SELECT utente.tipo FROM utente WHERE email='$email' AND password='$password'");
    $tipo = $tab->fetch_assoc();
            if($tipo['tipo'] == "azienda"){
            header("Refresh:0, url=offerta.php?AreaLavorativa=$AreaLavorativa");
            echo "$AreaLavorativa";
        } else if($tipo['tipo'] == "privato"){
            header("Refresh:0, url=domanda.php?AreaLavorativa=$AreaLavorativa");
            echo"$AreaLavorativa";
        }
    
    
?>