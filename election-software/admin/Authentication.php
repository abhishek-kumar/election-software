<?php 
//Election Software
//Licensed under GNU GPL
//Author: Abhishek Kumar

//Authorization Page

session_start();
require_once('../include/Global.inc');

//Check for authentication:

$username=$_POST["txtusername"];
$password=$_POST["txtpassword"];
//admin pass is case sensitive!
$redirecturl = "index.php";
$intromsg = "";

//Check if already logged in
//echo "Checking if already logged in<br>";
if (isset($_SESSION["user_id"])) //Already logged in
	header("Location: ".$redirecturl); //Redirect
else
	//Check if fields are filled and submitted
	if($username && $password)
	{
		try
		{
			if (login($username, $password) && $_SESSION['privilege']>2)
			{
				$_SESSION['user_id'] = $username;
				//note that privilege & group_id are set in the login function itself
				$_SESSION['login_time'] = mktime(date("H"), date("i"), date("s"), date("m"), date("d"), date("y"));
				$_SESSION['end_time'] = mktime(date("H")+$TIMEOUT_HOURS, date("i")+$TIMEOUT_MINUTES, date("s")+$TIMEOUT_SECONDS, date("m"), date("d"), date("y"));
				
				//echo "Login successful";
				header("Location: ".$redirecturl); //redirect
			}
			else
				//echo "login failed";
				logout();
				$intromsg = "<font color = 'red'>Incorrect Username or Password</font><br>&nbsp;&nbsp;";
		}
		catch (Exception $e)
		{
		//echo "ERROR";
		header("Location: Error.php?ErrorMsg=".addslashes($e->getMessage()));
		}
	}

include('Header.content'); 
?>
<form id="form1" name="form1" method="post" action="Authentication.php">
<div align="centre">

  <table width="700" border="0" cellspacing="0" cellpadding="1">
    <tr>
      <td width="54">&nbsp;</td>
      <td width="178">&nbsp;</td>
      <td width="468">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="3"><div align="left">&nbsp;&nbsp;<?php echo $intromsg ?>Enter your username and password to proceed. </div></td>
      </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><div align="right">Username:&nbsp;</div></td>
      <td><div align="left">
        <label>
        <input name="txtusername" type="text" id="txtusername" size="20" maxlength="20" />
        </label>
        
        
        </div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><div align="right">Password:&nbsp;</div></td>
      <td><div align="left">
        <label>
        <input name="txtpassword" type="password" id="txtpassword" size="20" maxlength="20" />
        </label>
      </div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><div align="left">
        <label>
        <input type="submit" name="Submit" value="Submit and Proceed &gt;&gt;" />
        </label>
      </div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>

</div>
</form>
<?php
include('Footer.content');
?>