SELECT datestamp, companyID, companyName, certsIssued, certsActive, fqdnsActive, regDomainsActive 
FROM issuers_timeline NATURAL JOIN company
ORDER BY datestamp ASC, certsActive DESC;

