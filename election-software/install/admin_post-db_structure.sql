CREATE TABLE `bits_centralbackup_candidates` (
`localserver` VARCHAR( 255 ) NOT NULL ,
`candidate_id` VARCHAR( 255 ) NOT NULL ,
`vote_count` INT NOT NULL DEFAULT '0'
) ENGINE = innodb COMMENT = 'Backup server collecting data from local servers';