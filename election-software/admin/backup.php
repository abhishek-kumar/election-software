<?php
require_once("../include/Global.inc");
$conn = db_connect();

if(!isset($_POST['localserverip']))
	header("Location: Error.php?ErrorMsg=wrong server contacting for backup!");
$localserverip = $_POST['localserverip'];
$candcount = $_POST['candcount'];
$errcount = 0;
//echo "candcount:".$candcount."<br>";

for($i=1; $i<=$candcount; $i++)
{
	//echo "i :".$i."<br>";
	
	$candidate_id = $_POST['candidate_id'.$i];
	$vote_count = $_POST['vote_count'.$i];
	//echo $candidate_id.":".$vote_count."<br>";
	//now to update
	try
	{
		$result = $conn->query("select * from bits_centralbackup_candidates where localserver='".$localserverip."' and candidate_id='".$candidate_id."';");
		if(!$result)
			throw new Exception("Could not get backup candidates for check");
		if ($result->num_rows<1)
		{
			//we have to insert
			$result = mysql_query("insert into bits_centralbackup_candidates values('".$localserverip."','".$candidate_id."','".$vote_count."');");
			if(!$result)
				throw new Exception("Couldnt insert into backup database");
			
		}
		else
		{
			//update
			//echo "updating: ".$vote_count."<br>";
			$result = mysql_query("UPDATE `bits_election`.`bits_centralbackup_candidates` SET `vote_count` = '".$vote_count."' WHERE CONVERT( `bits_centralbackup_candidates`.`localserver` USING utf8 ) = '".$localserverip."' AND CONVERT( `bits_centralbackup_candidates`.`candidate_id` USING utf8 ) = '".$candidate_id."' LIMIT 1 ;");
			if(!$result)
				echo "error updating";
//				throw new Exception("Couldnt Update backup database");
		}

	}
	catch(Exception $e)
	{
		$errcount++;
	}
}
//echo "Location: http://".$localserverip.$ELECTION_STATUS."&errorcount=".$errcount;
if($errcount==0)
	header("Location: http://".$localserverip.$ELECTION_STATUS);
else
	header("Location: http://".$localserverip.$ELECTION_STATUS."&errorcount=".$errcount);
?>