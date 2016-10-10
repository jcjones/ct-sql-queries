SELECT issuerID, companyName, commonName, authorityKeyID
FROM issuer NATURAL JOIN issuer_company NATURAL JOIN company
ORDER BY companyName;

