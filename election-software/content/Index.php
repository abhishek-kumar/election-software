<?php
//Election Software
//Licensed under GNU GPL v3
//Author: Abhishek Kumar

//Index
session_start();
require_once('../include/Global.inc');

//Check if logged in
if(!(logged_in()))
	header("Location: Authentication.php");

//Check if user has finished voting
if(votecasted())
{
	logout();
	header("Location: Error.php?ErrorMsg=User has casted vote and yet logged in. Probably user is admin or there has been a problem."); 
}

//Check for time limits
if(timeexceeded()) //timeexceeded and vote not yet casted!
{
	markuserasvotecasted();
	logout();
	header("Location: Done.php"); 
}

//add header
require_once('Header.content');
?>

<div align="center">
<table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><form name="form1" method="post" action="">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="100%"><div align="right">Time Remaining:
            <input name="remtime" type="text" id="remtime" value="<?php 
	
	$remaining = get_time_difference(date("H:i:s"), date("H:i:s", $_SESSION['end_time']));
	echo $remaining['hours'].":".$remaining['minutes'].":".$remaining['seconds'];
	
	?>" size="9" maxlength="9">
          </div></td>
        </tr>
      </table>
        </form>    </td>
  </tr>
  
  <tr>
    <td colspan="3"><div align="right"><?php echo $ELECTION_BLOCKHEADERMSG."<br><br>"; ?></div></td>
    </tr>
  <tr>
    <td colspan="3">
<?php
	//add the election code
	showelectioncontent();
?>	</td>
  </tr>
  <tr>
    <td colspan="3"><div align="right"><?php echo $ELECTION_BLOCKFOOTERMSG; ?></div></td>
    </tr>
</table>
</div>

<script language="javascript">
var hours = <?php echo $remaining['hours']; ?>;
var minutes = <?php echo $remaining['minutes']; ?>;
var seconds = <?php echo $remaining['seconds']; ?>;
var mTimer;
setTimeout('Calctimerem();', 1000);

function Calctimerem()
{
	seconds--;
	if(seconds<0)
	{
		//reduce minutes
		minutes--;
		seconds+=60;
		if(minutes<0)
		{
			//reduce hours
			hours--;
			minutes+=60;
			
			if(hours<0)
			{
				hours=0;
				document.formelection.submit();
			}
		}
	}
	if(hours==0 && minutes==0 && seconds==0)
		document.formelection.submit();
		
	document.form1.remtime.value = hours + ":" + minutes + ":" + seconds;
	setTimeout('Calctimerem();', 1000);
}
</script>
<?php
//add time showing code



//add footer
require_once('Footer.content');

//Done!
?>