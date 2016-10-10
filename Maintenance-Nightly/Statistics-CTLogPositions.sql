SELECT 
    l.url as logURL,
    (SELECT 
            MAX(entryId)
        FROM
            ctlogentry
        WHERE
            logId = l.logId) as latestLogEntryID
FROM
    ctlog AS l;
