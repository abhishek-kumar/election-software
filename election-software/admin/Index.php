<?php
//Election Software
//Licensed under GNU GPL v3
//Author: Abhishek Kumar

//Index
session_start();
require_once('../include/Global.inc');

//Check if logged in
if(!(isset($_SESSION['user_id'])))
	header("Location: Authentication.php");
else
	if($_SESSION['privilege']<3)
		header("Location: Logout.php");


//add header
require_once('Header.content');
?>
<table width="97%" border="0" cellspacing="5" cellpadding="0">
  <tr>
    <td colspan="2"><div align="left"><span style="font-size: 14px;color: #000000;font-weight: bold;font-family: Arial, Helvetica, sans-serif;">Administrative Section </span><br />
      Warning: Direct editing of database tables can make the election software inoperable.<br />
      &nbsp;<br /> 
      </div>    </tr>
  <tr>
    <td width="200"><div align="right">
	<?php require_once("AdminMenu.content"); ?>
	</div></td>
    <td width="731"><div align="right">
	<?php
	if($menu=="Admin Home")
		require_once("AdminHome.content");
	else if($menu=="Users")
		require_once("Users.content");
	else if($menu=="Election Status")
		require_once("Electionstatus.content");
	else if($menu=="Database Entry")
		require_once("DB.content");
	else if($menu=="Results")
		require_once("Results.content");
	
	?>
	</div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<p>
  <?php
//add time showing code


//add footer
require_once('Footer.content');

//Done!
?>
</p>
