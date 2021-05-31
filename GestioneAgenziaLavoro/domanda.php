<?php
$AreaLavorativa =$_GET['AreaLavorativa'];
echo"<html>

<head>
    <title>TODO supply a title</title>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <link rel='stylesheet' type='text/css' href='cssDomandaOfferta.css'>
</head>

<body>
<div class='container' id='container'>
<form action='richiesta_domanda.php?AreaLavorativa=$AreaLavorativa' method='POST'>
<h1>$AreaLavorativa</h1>
    <p>Richiesta domanda</p><br>
    <input type='text' placeholder='Nome' name='nome' />
    <input type='text' placeholder='Cognome' name='cognome' />
    <textarea type='text' placeholder='Curriculum' name='curriculum_vitae' cols='40' rows='5'></textarea><br>
    <input type='text' placeholder='Telefono' name='telefono' />
    <textarea type='text' placeholder='Altro' name='altro' cols='40' rows='5'></textarea><br>
    <button>Invia Domanda</button>
</form>
</div>
";

    $mysqli = new mysqli('localhost', 'root', '', 'elaborato_domanda_offerta_lavoro');
    $query_id_aree_lavorative="SELECT id FROM aree_lavorative WHERE aree_lavorative.nome='$AreaLavorativa'";
    $result1 = $mysqli->query($query_id_aree_lavorative);
    $risultato1 = $result1->fetch_array();
    $query = "SELECT * FROM offerta WHERE id_aree_lavorative=${risultato1['id']}";
    $result =  $mysqli->query($query);
    while ($risultato = $result->fetch_assoc()) {
            echo" 
                <div style='margin-top: 2%'>
                <div class='container' id='container'>
                <div id='domandaLavoro'>
                <h1>Offerta di lavoro</h1>
                </div>
                <div id='propostaofferta'>Nome Azienda: ${risultato['nome_azienda']}</div>
                <div id='propostaofferta'>Informazioni Azienda: ${risultato['informazioni_azienda']}</div>
                <div id='propostaofferta'>Tel: ${risultato['telefono']}</div>
                <div id='propostaofferta'>Altro: ${risultato['altro']}</div>
                </div>
                </div>
                ";
    }
    echo"</body></html>";
?>