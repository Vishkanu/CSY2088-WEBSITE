<?php
function sendemail($email,$subject,$message){

    $message = wordwrap($message,70,"/r/n");

    mail($email,$subject,$message);
}