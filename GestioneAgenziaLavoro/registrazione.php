
<?php
$nome_o_nomeazienda = $_POST["nome"];
$cognome = $_POST["cognome"];
$cf_o_id= $_POST["CF"];
$email = $_POST["email"];
$telefono = $_POST["telefono"];
$password = $_POST["password"];
$tipo=$_POST["tipo"];


$mysqli = new mysqli('localhost', 'root', '', 'elaborato_domanda_offerta_lavoro');
$tab = $mysqli->query("INSERT INTO `utente`(`nome_o_nomeazienda`, `cognome`, `cf_o_id`, `email`, `telefono`, `password`, `tipo`) VALUES ('$nome_o_nomeazienda','$cognome','$cf_o_id','$email','$telefono','$password','$tipo')");
header("Refresh:0; url=index.html?email=$email");


?>