<?php
$nome_azienda = $_POST['nome_azienda'];
$informazioni_azienda = $_POST['informazioni_azienda'];
$telefono = $_POST['telefono'];
$altro = $_POST['altro'];
$AreaLavorativa =$_GET['AreaLavorativa'];
$mysqli = new mysqli('localhost', 'root', '', 'elaborato_domanda_offerta_lavoro');
$tab = $mysqli->query("SELECT * FROM `aree_lavorative` WHERE aree_lavorative.nome='$AreaLavorativa'");
    while ($risultato = $tab->fetch_assoc()) {
        echo" <div>${risultato['id']}</div>";
       
        $risult = $mysqli->query("INSERT INTO `offerta`(`altro`, `id_aree_lavorative`, `nome_azienda`, `informazioni_azienda`, `telefono`) VALUES  
                                ('$altro','${risultato['id']}','$nome_azienda','$informazioni_azienda','$telefono')");
}
header("Refresh:0, url=offerta.php?AreaLavorativa=$AreaLavorativa");
?>