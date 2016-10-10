--INSERT INTO `issuers_timeline` SELECT 
--	date(DATE_SUB(NOW(), INTERVAL 1 DAY)) AS `datestamp`,
--	`companyID` AS `companyID`,
--    COUNT(certID) AS `numCertsActive`
--FROM `unexpired_certificate` NATURAL JOIN `issuer_company`
--GROUP BY `companyID`;

INSERT IGNORE INTO `issuers_timeline` SELECT
    date(DATE_SUB(NOW(), INTERVAL 1 DAY)) AS `datestamp`,
    `companyID` AS `companyID`,
    (SELECT COUNT(1) FROM `unexpired_certificate`
           NATURAL JOIN `issuer_company`
       WHERE `companyid` = `company`.`companyid`) AS `certsActive`,
    (SELECT COUNT(1) FROM `unexpired_certificate`
           NATURAL JOIN `issuer_company`
       WHERE date(`notBefore`) = DATE_SUB(date(NOW()), INTERVAL 1 DAY)
         AND `companyid` = `company`.`companyid`) as `certsIssued`,
    NULL AS `fqdnsActive`,
    NULL AS `regDomainsActive`
FROM
    company;

UPDATE `issuers_timeline` AS i, `le_timeline` AS l SET 
   i.`certsIssued`=l.`certsIssued`, 
   i.`fqdnsActive`=l.`fqdnsActive`, 
   i.`regDomainsActive`=l.`regDomainsActive`
WHERE i.`companyID`=1 AND i.`datestamp`=l.`datestamp`;
