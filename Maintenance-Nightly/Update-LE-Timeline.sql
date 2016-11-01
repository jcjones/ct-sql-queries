SET @datestamp = NOW();

DELETE FROM unexpired_certificate WHERE `notAfter` < date(@datestamp);

START TRANSACTION READ WRITE;
TRUNCATE le_domain;
COMMIT;
INSERT IGNORE INTO le_domain SELECT
        `registereddomain`.`regdomID` AS `regdomID`,
	`registereddomain`.`domain` AS `domain`,
        `registereddomain`.`etld` AS `etld`
    FROM `le_current_certificate`
    NATURAL JOIN `cert_registereddomain`
    NATURAL JOIN `registereddomain`;

START TRANSACTION READ WRITE;
TRUNCATE le_fqdn;
COMMIT;
INSERT IGNORE INTO le_fqdn SELECT
        `nameID` AS `nameID`,
        `name` AS `name`
    FROM `le_current_certificate`
    NATURAL JOIN `cert_fqdn`
    NATURAL JOIN `fqdn`;

INSERT INTO `le_timeline` SELECT 
    date(DATE_SUB(@datestamp, INTERVAL 1 DAY)) as `datestamp`, 
    (SELECT COUNT(1) FROM `le_current_certificate`
       WHERE date(`notBefore`) = DATE_SUB(date(@datestamp), INTERVAL 1 DAY)) as `certsIssued`,
    (SELECT COUNT(1) FROM `le_current_certificate`) as `certsActive`,
    (SELECT COUNT(1) FROM `le_fqdn`) as `fqdnsActive`,
    (SELECT COUNT(1) FROM `le_domain`) as `regDomainsActive`;

