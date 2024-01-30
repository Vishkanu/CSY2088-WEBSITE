<?php
$server = 'mysql';
$schema = 'csy2088';
$username = 'student';
$password = 'student';

$pdo = new PDO('mysql:dbname=' . $schema . ';host=' . $server, $username, $password);