INSERT INTO `le_timeline` SELECT
	date(`notBefore`) as `datestamp`,
    count(1) as `certsIssued`,
    NULL as `certsActive`,
    NULL as `fqdnsActive`,
    NULL as `regDomainsActive`
FROM le_certificate GROUP BY date(`notBefore`);

