SELECT issuerID, commonName, authorityKeyID 
FROM issuer NATURAL LEFT JOIN issuer_company NATURAL LEFT JOIN company 
WHERE companyID IS NULL ORDER BY commonName DESC;
