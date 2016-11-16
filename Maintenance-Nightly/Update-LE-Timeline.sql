SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET @datestamp = date(DATE_SUB(NOW(), INTERVAL 1 DAY));

START TRANSACTION READ WRITE;
INSERT IGNORE INTO `lestats`.`le_timeline` SET `datestamp`=@datestamp;
COMMIT;

START TRANSACTION READ WRITE;
DELETE FROM unexpired_certificate WHERE `notAfter` < @datestamp;
UPDATE `lestats`.`le_timeline` SET 
    `certsIssued`=(SELECT COUNT(1) FROM `ctdb`.`le_current_certificate` WHERE date(`notBefore`)=@datestamp),
    `certsActive`=(SELECT COUNT(1) FROM `ctdb`.`le_current_certificate`)
  WHERE `datestamp`=@datestamp;
COMMIT;

START TRANSACTION READ WRITE;
TRUNCATE `ctdb`.le_domain;
COMMIT;

START TRANSACTION READ WRITE;
INSERT IGNORE INTO `ctdb`.le_domain SELECT
        `registereddomain`.`regdomID` AS `regdomID`,
	`registereddomain`.`domain` AS `domain`,
        `registereddomain`.`etld` AS `etld`
    FROM `ctdb`.`le_current_certificate`
    NATURAL JOIN `cert_registereddomain`
    NATURAL JOIN `registereddomain`;

UPDATE `lestats`.`le_timeline` SET `regDomainsActive`=(SELECT count(1) FROM `ctdb`.`le_domain`) WHERE `datestamp`=@datestamp;
COMMIT;

START TRANSACTION READ WRITE;
TRUNCATE `ctdb`.le_fqdn;
COMMIT;

START TRANSACTION READ WRITE;
INSERT IGNORE INTO `ctdb`.le_fqdn SELECT
        `nameID` AS `nameID`,
        `name` AS `name`
    FROM `ctdb`.`le_current_certificate`
    NATURAL JOIN `cert_fqdn`
    NATURAL JOIN `fqdn`;

UPDATE `lestats`.`le_timeline` SET `fqdnsActive`=(SELECT count(1) FROM `ctdb`.`le_fqdn`) WHERE `datestamp`=@datestamp;
COMMIT;
