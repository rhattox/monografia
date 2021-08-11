<?php
echo "Començo do programa\nEsperando 10 segundos....";
sleep(10);
include("enviaGET.php");
// Create a cURL handle
//$ch = curl_init('http://localhost:5000');
//echo $http_status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
$ch = curl_init("http://127.0.0.1:5000");
$cores = array('red','orange','yellow','green','blue','indigo','violet');
$execucoes = 0;
    while ($execucoes <= 6){
        // Execute
        curl_exec($ch);

        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        echo $http_code;
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
        //curl_close($ch);
        $execucoes ++ ;
        sleep(3);
    }
?>