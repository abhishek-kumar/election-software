<?php


require_once('Header.content');
?>
<script language="javascript">
setTimeout('RedirectToLogin();',5000);
function RedirectToLogin()
{
	window.location = "Authentication.php";
}
</script>
&nbsp;&nbsp;You have successfully cast your vote. Please vacate the Computer and proceed to exit. 
<?php
require_once('Footer.content');
?>