CREATE VIEW `le_certificate` AS
    SELECT 
        `certificate`.`certID` AS `certID`,
        `certificate`.`serial` AS `serial`,
        `certificate`.`issuerID` AS `issuerID`,
        `certificate`.`subject` AS `subject`,
        `certificate`.`notBefore` AS `notBefore`,
        `certificate`.`notAfter` AS `notAfter`
    FROM
        `certificate`
    WHERE
        (`certificate`.`issuerID` = (SELECT 
                `issuer`.`issuerID`
            FROM
                `issuer`
            WHERE
                (`issuer`.`authorityKeyId` = 'qEpqYwR93brm0Tm3pkVl7/Oo7KE=')));

CREATE VIEW `unexpired_certificate` AS
    SELECT 
        `certificate`.`certID` AS `certID`,
        `certificate`.`serial` AS `serial`,
        `certificate`.`issuerID` AS `issuerID`,
        `certificate`.`subject` AS `subject`,
        `certificate`.`notBefore` AS `notBefore`,
        `certificate`.`notAfter` AS `notAfter`
    FROM
        `certificate`
    WHERE
        (NOW() BETWEEN `certificate`.`notBefore` AND `certificate`.`notAfter`);
        
CREATE VIEW `le_current_certificate` AS
    SELECT 
        `certificate`.`certID` AS `certID`,
        `certificate`.`serial` AS `serial`,
        `certificate`.`issuerID` AS `issuerID`,
        `certificate`.`subject` AS `subject`,
        `certificate`.`notBefore` AS `notBefore`,
        `certificate`.`notAfter` AS `notAfter`
    FROM
        `certificate`
    WHERE
        ((`certificate`.`issuerID` = (SELECT 
                `issuer`.`issuerID`
            FROM
                `issuer`
            WHERE
                (`issuer`.`authorityKeyId` = 'qEpqYwR93brm0Tm3pkVl7/Oo7KE=')))
AND (NOW() BETWEEN `certificate`.`notBefore` AND `certificate`.`notAfter`));