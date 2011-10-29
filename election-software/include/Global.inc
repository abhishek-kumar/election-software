<?php
//This is the global include file.
require_once('../Config/Config.php');

function db_connect()
{
if(!($result = mysql_connect('localhost', 'user', 'teamsantro')))
	throw new Exception('Could not connect to database server (mysql_connect)');
mysql_select_db('bits_election');

$result = new mysqli('localhost', 'user', 'teamsantro', 'bits_election');
if (!$result)
  throw new Exception('Could not connect to database server');
else
  return $result;
}

function login($username, $password)
{
//connect to db
$conn = db_connect();

//check if user is logged in and casted his vote already!
	if(votecasted())
	{
		logout();
		header("Location: Done.php");
	}

//check for username
	$result = $conn->query("select * from bits_users where username='$username' and password='".md5($password)."';");
	if (!$result)
	  throw new Exception('Could not log you in.');
	if ($result->num_rows<1)
	  return false;

//Perform the login	
	$_SESSION['user_id'] = $username;
	//time parameters are set in the login page
	
	$result = $conn->query("select group_id from bits_users where username='$username';");
	if (!$result)
		return false;
	$row = $result->fetch_row();
	$gid = $row[0];
	$_SESSION['group_id'] = $gid;
	
	$result = $conn->query("select privilege from bits_groups where group_id='$gid';");
	if (!$result)
		return false;
	$row = $result->fetch_row();
	$_SESSION['privilege'] = $row[0];


	//If admin has logged in, then no further questions!
	if($_SESSION['privilege']>2)
		return true;

//check if user has finished voting
	if(votecasted())
	{
		logout();
		header("Location: Done.php");
		return false;
	}
	


//check if user has already logged in from else where
	$result = $conn->query("select login_status from bits_users where username='$username';"); //assuming username is unique
	if(!$result)
		throw new Exception('Could not log you in.');
	if ($result->num_rows<1)
	  return false;
	$row = $result->fetch_row();
	if($row[0]>0)
	{
		//redirect, assuming that no headers were sent (login is the first thing thats done even before sending anything!
		logout();
		header("Location: Error.php?ErrorMsg=You have already logged in from another computer. You cannot login again from another computer.");
		return false;
	}



//The most important part. Mark user as logged in
	$result = $conn->query("update bits_users set login_status=1 where username='$username';");
	if(!$result)
	{
		//rollback
		logout();
		throw new Exception("Could not update login_status");
		//if it has still reached till here, logout and return false
		header("Location: Logout.php");
		return false;
	}

$conn->close;
return true;
}

function logged_in()
{
	//Check if logged in
	if(isset($_SESSION['user_id']))
		return true;
	else
		return false;
}


function logout()
{
	unset($_SESSION['user_id']);
	unset($_SESSION['privilege']);
	unset($_SESSION['group_id']);
	unset($_SESSION['login_time']);
	unset($_SESSION['end_time']);
}

function markuserasvotecasted()
{
	if(!(logged_in()))
		throw new Exception("user not logged in. Cannot mark vote as casted!");
	
	//connect to db
	$conn = db_connect();
	
	$result = $conn->query("UPDATE `bits_users` SET `vote_status` = '1' WHERE CONVERT( `username` USING utf8 ) = '".$_SESSION['user_id']."';");
	
	if(!$result)
		throw new Exception("Cannot update vote_status");
	
	return true;
}
function votecasted()
{
	if(!(logged_in()))
		return false;
	
	//connect to db
	$conn = db_connect();
	
	$result = $conn->query("select vote_status from bits_users where username='".$_SESSION['user_id']."';");
	if(!$result)
		throw new Exception("Could not receive vote status from database. (User ID=".$_SESSION['user_id'].")");
	$row = $result->fetch_row();
	$vote_status = $row[0];
	if($vote_status == 0)
		return false;
	else if($vote_status > 0)
		return true;
	else
		throw new Exception("vote_status has invalid status code:".$vote_status);
}

function get_time_difference( $start, $end )
{
    $uts['start']      =    strtotime( $start );
    $uts['end']        =    strtotime( $end );
    if( $uts['start']!==-1 && $uts['end']!==-1 )
    {
        if( $uts['end'] >= $uts['start'] )
        {
            $diff    =    $uts['end'] - $uts['start'];
            if( $days=intval((floor($diff/86400))) )
                $diff = $diff % 86400;
            if( $hours=intval((floor($diff/3600))) )
                $diff = $diff % 3600;
            if( $minutes=intval((floor($diff/60))) )
                $diff = $diff % 60;
            $diff    =    intval( $diff );            
            return( array('days'=>$days, 'hours'=>$hours, 'minutes'=>$minutes, 'seconds'=>$diff) );
        }
        else
        {
            return( array('days'=>-1, 'hours'=>-1, 'minutes'=>-1, 'seconds'=>-1) );
        }
    }
    else
    {
        return( array('days'=>-2, 'hours'=>-2, 'minutes'=>-2, 'seconds'=>-2) );
    }
    return( false );
}

function timeexceeded()
{
	//$start = date("H:i:s", $_SESSION['login_time']);
	$tnow = strtotime(date("H:i:s"));
	$tend = strtotime(date("H:i:s", $_SESSION['end_time']));
	if($tnow >= $tend)
		return true;
	else
		return false;
	
	
}

function showelectioncontent()
{
	if(!(isset($_SESSION['user_id'])))
		throw new Exception("user not logged in.Cant show any content!");
	
	//connect to db
	$conn = db_connect();
	
	//declarations to hold buffer before database storage
	$candidatelist[0]=0;
	$candidatelistcount=-1;
	
	echo '<form name="formelection" method="post" action="Index.php">';
	
	//Get the list of electionsets to show
	$sql = "select * from bits_groups_es where group_id='".$_SESSION['group_id']."' order by priority;";
	$result = mysql_query($sql);
	if(!$result)
		throw new Exception("Cannot read bits_groups_es with group:".$_SESSION['group_id']);
	
	$thisistherow=0;
	if(!isset($_POST['es_id']))
	{
		$thisistherow=1;
	}
		
	while($row = mysql_fetch_array($result)){
		extract($row);
		if($thisistherow==1)
		{
			$thisistherow=0;
			//Show the content!
			//show election_set information
			$sql = "select * from bits_electionsets where es_id='".$es_id."';";
			$result_tmp = mysql_query($sql);
			if(!$result_tmp)
				throw new Exception("Cannot read bits_electionsets with es_id:".$es_id);
			while($row_tmp = mysql_fetch_array($result_tmp))
			{
				extract($row_tmp);
				echo '<div align="left"><span style="font-size: 14px;color: #000000;font-weight: bold;font-family: Arial, Helvetica, sans-serif;">'.$name.'</span></div><br><div align="left">'.$description.'</div><br><br>';
			}
			
			//fetch posts.
			$sql = "select * from bits_posts where es_id='".$es_id."';";
			$result1 = mysql_query($sql);
			if(!$result1)
				throw new Exception("Cannot read bits_posts with es_id:".$es_id);
			//Initialize header
				echo '<input name="es_id" type="hidden" id="es_id" value="'.$es_id.'"><div align="center">';
		        echo '<table width="90%" border="0" cellspacing="2" cellpadding="1" style="border: 2px dotted #808080">';
    
			//show all posts
			while($row1 = mysql_fetch_array($result1)){
	      		extract($row1);
				echo '<tr>';
	            echo '<td colspan="2"><div align="left">';
				if($description !== "")
					echo $name."(".$description.")";
				else
					echo $name;
				
				//fetch candidates for this post
				$sql = "select * from bits_candidates where post_id='".$post_id."';";
				$result2 = mysql_query($sql);
				if(!$result2)
					throw new Exception("Cannot read bits_candidates with post_id:".$post_id);
				//Initialize Header
					echo '</div></td>';
		          	echo '</tr>';
        		  	echo '<tr>';
            		echo '<td width="50">&nbsp;</td>';
            		echo '<td><div align="left">';
				
				//show all candidates
				while($row2 = mysql_fetch_array($result2)){
					extract($row2);
					if($description=="")
						echo '<label><input name="'.$post_id.'" type="radio" value="'.$candidate_id.'">'.$name.'</label><br>';
					else
					if((substr_count(strtoupper($name),"NONE OF THE CANDIDATES")>0) || (substr_count(strtoupper($name),"NO ANSWER")>0))
						echo '<label><input name="'.$post_id.'" type="radio" value="'.$candidate_id.'" checked>'.$name.'('.$description.')</label><br>';
					else
						echo '<label><input name="'.$post_id.'" type="radio" value="'.$candidate_id.'">'.$name.'('.$description.')</label><br>';
				}
				
				//Footer
					echo '</div></td>';
          			echo '</tr>';
          			echo '<tr>';
            		echo '<td colspan="2">&nbsp;</td>';
		        	echo '</tr>';
			}
			
			//Footer
					echo '<tr>';
            		echo '<td colspan="2"><div align="right">';
              		echo '<label>Please be sure before submitting. You cannot modify later:&nbsp;';
              		echo '<input type="submit" name="Submit" value="Submit &gt;&gt;">';
              		echo '</label>';
            		echo '</div></td>';
          			echo '</tr>';
					echo '</table></div>';
					echo '</form><BR><BR>';
			break;
		}
		else
		if(isset($_POST['es_id']))
		{
			if($_POST['es_id']==$es_id)
				$thisistherow=1;	
			
			//Now main task: store _POST contents
			//fetch posts.
			$sql = "select * from bits_posts where es_id='".$es_id."';";
			$result1 = mysql_query($sql);
			if(!$result1)
				throw new Exception("Cannot read bits_posts with es_id:".$es_id);
				
			//store all posts
			while($row1 = mysql_fetch_array($result1)){
	      		extract($row1);
				$candidatelistcount++;
				$candidatelist[$candidatelistcount]=$_POST[$post_id];
				echo '<input name="'.$post_id.'" type="hidden" id="'.$post_id.'" value="'.$_POST[$post_id].'">';
			}
		}
	
	}
	if($thisistherow==1)
	{
		echo '</form><BR><BR>';
		
		//now to save the values.
		$clcount=0;
		while($clcount<=$candidatelistcount)
		{	
			
			//get the vote count
			$result = mysql_query("select vote_count from bits_candidates where candidate_id='".$candidatelist[$clcount]."';");
			if(!$result)
				throw new Exception("Could Not retrieve vote_count of candidate:".$candidatelist[$clcount]);
			
			//echo "vote_count".$vote_count;
			$row = mysql_fetch_array($result);
			
			//echo "row".$row;
			extract($row);
			$vote_count = $vote_count + 1;
			
			//update
			$result = mysql_query("UPDATE `bits_election`.`bits_candidates` SET `vote_count` = '".$vote_count."' WHERE `bits_candidates`.`candidate_id` =".$candidatelist[$clcount]." LIMIT 1 ;");
			if(!$result)
				throw new Exception("Could Not save vote_count:[".$vote_count."] of candidate:".$candidatelist[$clcount]);
			
			
			$clcount = $clcount + 1;
		}
		
		//if values stored successfully, mark as voted. and done!
			markuserasvotecasted();
			logout();
			echo '<script language="javascript"> window.location="Done.php"</script>'; 
	}
}

?>