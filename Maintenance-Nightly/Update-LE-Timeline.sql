START TRANSACTION READ WRITE;
INSERT IGNORE INTO unexpired_certificate SELECT
        `certificate`.`certID` AS `certID`,
        `certificate`.`serial` AS `serial`,
        `certificate`.`issuerID` AS `issuerID`,
        `certificate`.`subject` AS `subject`,
        `certificate`.`notBefore` AS `notBefore`,
        `certificate`.`notAfter` AS `notAfter`
    FROM
        `certificate`
    WHERE
         NOW() BETWEEN `certificate`.`notBefore` AND `certificate`.`notAfter`;

DELETE FROM unexpired_certificate WHERE `notAfter` < NOW();
COMMIT;

START TRANSACTION READ WRITE;
INSERT IGNORE INTO le_current_certificate SELECT
        `unexpired_certificate`.`certID` AS `certID`,
        `unexpired_certificate`.`serial` AS `serial`,
        `unexpired_certificate`.`issuerID` AS `issuerID`,
        `unexpired_certificate`.`subject` AS `subject`,
        `unexpired_certificate`.`notBefore` AS `notBefore`,
        `unexpired_certificate`.`notAfter` AS `notAfter`
    FROM
        `unexpired_certificate`
    WHERE
        ((`unexpired_certificate`.`issuerID` = (SELECT
                `issuer`.`issuerID`
            FROM
                `issuer`
            WHERE
                (`issuer`.`authorityKeyID` = 'qEpqYwR93brm0Tm3pkVl7/Oo7KE=')))
            AND (NOW() BETWEEN `unexpired_certificate`.`notBefore` AND `unexpired_certificate`.`notAfter`));

DELETE FROM le_current_certificate WHERE `notAfter` < NOW();
COMMIT;

START TRANSACTION READ WRITE;
TRUNCATE le_domain;
INSERT IGNORE INTO le_domain SELECT
        `registereddomain`.`regdomID` AS `regdomID`,
	`registereddomain`.`domain` AS `domain`,
        `registereddomain`.`etld` AS `etld`
    FROM `le_current_certificate`
    NATURAL JOIN `cert_registereddomain`
    NATURAL JOIN `registereddomain`;
COMMIT;

START TRANSACTION READ WRITE;
TRUNCATE le_fqdn;
INSERT IGNORE INTO le_fqdn SELECT
        `nameID` AS `nameID`,
        `name` AS `name`
    FROM `le_current_certificate`
    NATURAL JOIN `cert_fqdn`
    NATURAL JOIN `fqdn`;
COMMIT;

INSERT INTO `le_timeline` SELECT 
    date(DATE_SUB(NOW(), INTERVAL 1 DAY)) as `datestamp`, 
    (SELECT COUNT(1) FROM `le_current_certificate`
       WHERE date(`notBefore`) = DATE_SUB(date(NOW()), INTERVAL 1 DAY)) as `certsIssued`,
    (SELECT COUNT(1) FROM `le_current_certificate`) as `certsActive`,
    (SELECT COUNT(1) FROM `le_fqdn`) as `fqdnsActive`,
    (SELECT COUNT(1) FROM `le_domain`) as `regDomainsActive`;

