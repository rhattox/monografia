<?php

function manda_mensagem($parametro){
    // Get cURL resource
    $curl = curl_init();
    // Set some options - we are passing in a useragent too here
    curl_setopt_array($curl, array(
        CURLOPT_RETURNTRANSFER => 1,
        CURLOPT_URL => "http://127.0.0.1:5000/monografia?param1=$parametro",
        CURLOPT_USERAGENT => 'User Agent X'
    ));

    // Send the request & save response to $resp
    $resp = curl_exec($curl);
    // Close request to clear up some resources
    curl_close($curl);

    return $resp;
}