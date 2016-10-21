SELECT
    `t`.`datestamp`,
    `cc`.`ISO3166-1-Alpha-3`,
    `t`.`numCertsActive` AS `numFQDNsActive`
FROM
    `le_timeline_countries` AS `t`
        JOIN
    `countrycodes` AS `cc` ON `t`.`country` = `cc`.`ISO3166-1-Alpha-2`
ORDER BY `datestamp` DESC, `numFQDNsActive` DESC;
