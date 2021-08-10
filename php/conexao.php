<?php
// Create a cURL handle
$ch = curl_init('http://node:5000');
$execucoes = 1;
while ($execucoes <= 10){
    // Execute
    curl_exec($ch);

    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

    if($http_code != 0){
        echo "\nResposta HTTP: $http_code";
        if($http_code == 200){
            echo "\tTudo certo! Começo do script de comunicação...\n";

        }
    }else{
        echo "\nServidor offline --> HTTP: $http_code \n";
    }
    // Close handle
    curl_close($ch);
    $execucoes ++ ;

}

?>