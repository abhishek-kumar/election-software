UPDATE `bits_election`.`bits_users` SET `login_status` = '0' WHERE login_status=1 AND vote_Status=0 LIMIT 1 ;
