CREATE TABLE IF NOT EXISTS `unexpired_certificate` (
  `certID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `issuerID` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `notBefore` datetime DEFAULT NULL,
  `notAfter` datetime DEFAULT NULL,
  PRIMARY KEY (`certID`),
  INDEX `unexpired-cert-notAfter` (`notAfter` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `le_current_certificate` (
  `certID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `serial` varchar(255) DEFAULT NULL,
  `issuerID` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `notBefore` datetime DEFAULT NULL,
  `notAfter` datetime DEFAULT NULL,
  PRIMARY KEY (`certID`),
  INDEX `le-cert-notAfter` (`notAfter` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `le_domain` (
    `regdomID` bigint(20),
    `domain` VARCHAR(255) UNIQUE NOT NULL,
    `etld` VARCHAR(255),
    PRIMARY KEY (`domain`)
);

CREATE TABLE IF NOT EXISTS `le_fqdn` (
    `nameID` bigint(20),
    `name` VARCHAR(255) UNIQUE NOT NULL,
    PRIMARY KEY (`nameID`)
);

CREATE TABLE IF NOT EXISTS `le_timeline` (
    `datestamp` date NOT NULL,
    `certsIssued` int(11) DEFAULT NULL,
    `certsActive` int(11) DEFAULT NULL,
    `fqdnsActive` int(11) DEFAULT NULL,
    `regDomainsActive` int(11) DEFAULT NULL,
    PRIMARY KEY (`datestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `le_timeline_countries` (
    `datestamp` date NOT NULL,
    `country` varchar(255) DEFAULT NULL,
    `numCertsActive` int(11) NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `issuers_timeline` (
  `datestamp` date NOT NULL,
  `companyID` int(11) NOT NULL,
  `certsIssued` int(11) DEFAULT NULL,
  `certsActive` int(11) DEFAULT NULL,
  `fqdnsActive` int(11) DEFAULT NULL,
  `regDomainsActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`datestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


