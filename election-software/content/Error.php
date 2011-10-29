<?php


require_once('Header.content');
?>
<script language="javascript">
setTimeout('RedirectToLogin();',20000);
function RedirectToLogin()
{
	window.location = "Authentication.php";
}
</script>
&nbsp;&nbsp;<table width="100%"  border="0">
  <tr>
    <td colspan="2"><div align="left"><span style="font-size: 14px;color: #000000;font-weight: bold;font-family: Arial, Helvetica, sans-serif;">An Error has occurred! </span></div></td>
    <td width="33%">&nbsp;</td>
  </tr>
  <tr>
    <td width="100">&nbsp;</td>
    <td width="60%"><div align="left"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="100">&nbsp;</td>
    <td><div align="left"><?php echo $_REQUEST['ErrorMsg']; ?></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="100">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
 
<?php
require_once('Footer.content');
?>