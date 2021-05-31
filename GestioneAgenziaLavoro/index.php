
<?php
$password = $_POST["password"];
$email = $_POST["email"];
$mysqli = new mysqli('localhost', 'root', '', 'elaborato_domanda_offerta_lavoro');
$tab = $mysqli->query("SELECT utente.password FROM `utente` WHERE utente.email='$email'");
$pwp = $tab->fetch_array(MYSQLI_ASSOC);
$pw = $pwp["password"];
echo "$pw";
$message = "email password errata";

if (empty($pw)) {
   echo "<script type='text/javascript'>alert('$message');</script>";
    header("Refresh:0; url=index.html");
} else if ($pw == $password) {
    header("Refresh:0; url=AreeLavorativehtml.php?email=$email&password=${pwp['password']}");
} else {
    echo "<script type='text/javascript'>alert('$message');</script>";
    header("Refresh:0; url=index.html");
}
?>