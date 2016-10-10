SELECT 
    COUNT(*) AS numDomains,
    (SELECT 
            COUNT(DISTINCT companyID)
        FROM
            registereddomain AS n2
                NATURAL JOIN
            certificate AS c2
                NATURAL JOIN
	    issuer AS i2
		NATURAL JOIN
            issuer_company AS ic2
        WHERE
            n2.domain = n.domain) AS numCompanies
FROM
    le_domain AS n
GROUP BY numCompanies;
