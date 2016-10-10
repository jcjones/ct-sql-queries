-- Clean up the le_fqdn and le_domain tables
-- Takes about 22 hours on this box, so we're better off truncating each table and rebuilding it each night.

CREATE TEMPORARY TABLE `stale_le_fqdn` SELECT 
    `lf`.`nameID`,
    `lf`.`name`,
    (SELECT count(1) FROM `cert_fqdn` NATURAL JOIN `le_current_certificate` WHERE `nameID` = `lf`.`nameID`) as `numActive`
FROM
    `le_fqdn` AS `lf`;
    
DELETE FROM `le_fqdn` WHERE `le_fqdn`.`nameID` IN (SELECT `nameID` FROM `stale_le_fqdn` WHERE `numActive`=0);

CREATE TEMPORARY TABLE `stale_le_domain` SELECT
    `ld`.`regdomID`,
    `ld`.`domain`,
    (SELECT count(1) FROM `icert_registereddomain` NATURAL JOIN `le_current_certificate` WHERE `regdomID` = `ld`.`regdomID`) as `numActive`
FROM
    `le_domain` AS `ld`;

DELETE FROM `le_domain` WHERE `le_domain`.`regdomID` IN (SELECT `regdomID` FROM `stale_le_domain` WHERE `numActive`=0);
