<?php

function CallAPI($method, $url, $data = false, $token = null )
    {
        $curl = curl_init($url);

        switch ($method)
        {
            case "POST":
                //curl_setopt($curl, CURLOPT_POST, 1);
                curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'POST');
                curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
                if ($data){
                    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                    //echo ("Burger!");
                }
                break;

            case "PUT":
                //curl_setopt($curl, CURLOPT_PUT, 1);
                curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'PUT');
                curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
                if ($data){
                    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                    //echo ("Felvéve!");
                }
                break;
            
            case "DELETE":
                curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'DELETE');
                curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));
                break;

            default:
                if ($data){
                    $url = sprintf("%s?%s", $url, http_build_query($data));
                }
               
        }
        
        if($token != null)
        {
            curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type: application/json','Auth:'.$token));
        }

        //$headers = array("Auth:"+);     
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_HEADER, 1); //kérnénk a headeröket is
        //curl_setopt($curl, CURLOPT_HTTPHEADER, $headers)
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); 
        //curl_setopt($curl, CURLOPT_HEADER, true);

        $result = curl_exec($curl);

        $header_size = curl_getinfo($curl, CURLINFO_HEADER_SIZE); //megnézzük milyen hosszú a header rész
        $authIndex = strpos($result,"auth: "); // megkeressük az auth: string pozicióját
        $header = "";
        if($authIndex) //ha kapunk auth stringet
        {
            $header = substr($result,$authIndex+6,36); //ha megvan hozzáadunk 6ot, auth = 4 + : + space, C# generált GUID 36 hosszú
        }
        else
        {
            $header = substr($result,0,$header_size); //minden header
        }
        $body = substr($result, $header_size); //a body meg a maradék

        //var_dump(curl_error($curl));
        curl_close($curl);
       
        $resultArray = array($header,$body);
        return $resultArray;
    }
?>