DROP VIEW IF EXISTS `le_certificate`;
DROP VIEW IF EXISTS `le_current_certificate`;

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

CREATE VIEW `le_current_certificate` AS
    SELECT
        `unexpired_certificate`.`certID` AS `certID`,
        `certificate`.`serial` AS `serial`,
        `unexpired_certificate`.`issuerID` AS `issuerID`,
        `certificate`.`subject` AS `subject`,
        `unexpired_certificate`.`notBefore` AS `notBefore`,
        `unexpired_certificate`.`notAfter` AS `notAfter`
    FROM
        `unexpired_certificate`
		JOIN
        `certificate` ON `unexpired_certificate`.`certID` =  `certificate`.`certID`
    WHERE
        ((`unexpired_certificate`.`issuerID` = (SELECT
                `issuer`.`issuerID`
            FROM
                `issuer`
            WHERE
                (`issuer`.`authorityKeyId` = 'qEpqYwR93brm0Tm3pkVl7/Oo7KE='))));
