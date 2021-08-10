<?php
include("enviaGET.php");
// Create a cURL handle
$ch = curl_init('http://node:5000');
$cores = array('red','orange','yellow','green','blue','indigo','violet');
$execucoes = 0;
    while ($execucoes <= 6){
        // Execute
        curl_exec($ch);

        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        if($http_code != 0){
            echo "\nResposta HTTP: $http_code";
            if($http_code == 200){
                // echo "\tTudo certo! Começo do script de comunicação...\n";
                $resposta = manda_mensagem($cores[$execucoes]);
                echo $resposta;
            }
        }else{
            echo "\nServidor offline --> HTTP: $http_code \n";
        }
        // Close handle
        curl_close($ch);
        $execucoes ++ ;
        sleep(3);
    }
?>