INSERT INTO `le_timeline_countries` SELECT
        date(now()) AS `datestamp`,
        `country` AS `country`,
        COUNT(1) AS `numCertsActive`
 FROM `le_current_certificate`
 NATURAL JOIN `cert_fqdn`
 NATURAL JOIN `resolvedplace`
GROUP BY `country` ORDER BY `numCertsActive`;

