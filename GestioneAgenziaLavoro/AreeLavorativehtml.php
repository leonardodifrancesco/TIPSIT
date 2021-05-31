<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>

<head>
    <title>TODO supply a title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="cssAreeLavorative.css">
</head>

<body>
    <center>
        <?php
            $email = $_GET['email'];
            $password = $_GET['password'];
            $mysqli = new mysqli('localhost', 'root', '', 'elaborato_domanda_offerta_lavoro');
            $tab = $mysqli->query("SELECT * FROM `aree_lavorative`");
            echo"
            <div class='container' id='container'>
            
            <form id='search_form' action='AreeLavorative.php?email=$email&password=$password' method='post'>
            <h1>In quale area professionale vuoi fare la tua domanda o offerta di lavoro?</h1>
            <label></label>
            <select name='AreaLavorativa'>";
            while($riga = $tab->fetch_array(MYSQLI_ASSOC)){
                echo"<option value='${riga['nome']}'>${riga['nome']}</option>";
                $id_aree_lavorative=$riga['id'];
               }
            echo"</select>
            <button>Submit</button>
            </form>
            </div>
            ";
        ?>
    </center>

</body>

</html>