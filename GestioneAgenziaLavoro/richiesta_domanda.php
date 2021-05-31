<?php
$nome = $_POST['nome'];
$cognome = $_POST['cognome'];
$curriculum_vitae = $_POST['curriculum_vitae'];
$telefono = $_POST['telefono'];
$altro = $_POST['altro'];
$AreaLavorativa =$_GET['AreaLavorativa'];
$mysqli = new mysqli('localhost', 'root', '', 'elaborato_domanda_offerta_lavoro');
$tab = $mysqli->query("SELECT * FROM `aree_lavorative` WHERE aree_lavorative.nome='$AreaLavorativa'");
    while ($risultato = $tab->fetch_assoc()) {
        echo" <div>${risultato['id']}</div>";
        $risult = $mysqli->query("INSERT INTO `domanda`(`altro`, `id_aree_lavorative`, `nome`, `cognome`, `telefono`, `curriculum_vitae`) VALUES ('$altro','${risultato['id']}','$nome','$cognome','$telefono','$curriculum_vitae')");
}
header("Refresh:0, url=domanda.php?AreaLavorativa=$AreaLavorativa");
?>