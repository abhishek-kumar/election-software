<?php
//Election Software
//Licensed under GNU GPL
//Author: Abhishek Kumar

//Logout Page
session_start();
require_once('../include/Global.inc');
logout();
header("Location: Authentication.php");
?>
