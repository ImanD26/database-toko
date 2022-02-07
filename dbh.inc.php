<?php

$servername = "localhost";
$dBusername = "Raphael";
$dBpassword = "test1234";
$dBName = "toko";

$conn = mysqli_connect($servername, $dBusername, $dBpassword, $dBName);

if(!$conn){
    die("Connection failed: ".mysqli_connect_error());
}