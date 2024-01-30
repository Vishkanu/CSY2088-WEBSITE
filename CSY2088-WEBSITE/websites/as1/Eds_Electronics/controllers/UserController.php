<?php
namespace Eds_Electronics\controllers;

use Exception;
use general\classes\DatabaseTable;

require_once '../functions.php';
class UserController
{
    public function home(){
    return [
        'title' => 'Ed\'s Electronics - Login',
        'template' => 'login',
        'templateVars' => array()
    ];}
    
}