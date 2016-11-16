DROP TABLE IF EXISTS `company`;
DROP TABLE IF EXISTS `issuer_company`;

CREATE TABLE IF NOT EXISTS `company` (
  `companyID` INT NOT NULL AUTO_INCREMENT,
  `companyName` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`companyID`));

CREATE TABLE IF NOT EXISTS `issuer_company` (
  `companyID` INT NOT NULL,
  `issuerID` INT NOT NULL,
  UNIQUE INDEX `issuerID_UNIQUE` (`issuerID` ASC));

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('Let\'s Encrypt', 1);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Let\'s Encrypt' WHERE `commonName` LIKE '%Let\'s Encrypt%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('Comodo', 2);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%COMODO%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%PositiveSSL%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%GlobalTrust%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%GlobeSSL%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%TrustAsia%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%TBS X509%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%InterContinental Hotels Group%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%USERTrust%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%SSL.com%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%McAfee%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%SecureCore%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%USERFirst%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%AAA Certificate%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%icewarp%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%Crazy Domains%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%DOMENY%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%K Software%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%ReliaSite%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%BlackCert%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%Western Digital%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%SignSec%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%InCommon%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%Gandi%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%Digi-Sign%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%Terena%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%TrustSign%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%EssentialSSL%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'COMODO' WHERE `commonName` LIKE '%Trusted Secure Certificate Authority%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('DigiCert', 3);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'DigiCert' WHERE `commonName` LIKE '%DigiCert%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'DigiCert' WHERE `commonName` LIKE 'Cybertrust%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'DigiCert' WHERE `commonName` LIKE '%GTE Cybertrust%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'DigiCert' WHERE `commonName` LIKE '%Baltimore Cybertrust%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('Entrust', 4);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Entrust' WHERE `commonName` LIKE '%Entrust%';
-- http://www.businesswire.com/news/home/20160322005639/en/Entrust-Datacard-Trend-Micro-Partner-Provide-Comprehensive
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Entrust' WHERE `commonName` LIKE '%Trend Micro%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('Symantec', 5);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Symantec' WHERE `commonName` LIKE '%Symantec%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Symantec' WHERE `commonName` LIKE '%GeoTrust%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Symantec' WHERE `commonName` LIKE '%AlphaSSL%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Symantec' WHERE `commonName` LIKE '%RapidSSL%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Symantec' WHERE `commonName` LIKE '%VeriSign%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Symantec' WHERE `commonName` LIKE '%Thawte%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('GlobalSign', 6);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'GlobalSign' WHERE `commonName` LIKE '%GlobalSign%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('GoDaddy', 7);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'GoDaddy' WHERE `commonName` LIKE '%GoDaddy%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'GoDaddy' WHERE `commonName` LIKE '%Go Daddy%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'GoDaddy' WHERE `commonName` LIKE '%Starfield%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('StartSSL', 8);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'StartSSL' WHERE `commonName` LIKE '%StartCom%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('WoSign', 9);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'WoSign' WHERE `commonName` LIKE '%WoSign%';
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'WoSign' WHERE `commonName` LIKE '%沃通免费%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('Network Solutions', 10);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Network Solutions' WHERE `commonName` LIKE '%Network Solutions%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('QuoVadis', 11);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'QuoVadis' WHERE `commonName` LIKE '%QuoVadis%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('Microsoft', 12);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Microsoft' WHERE `commonName` LIKE '%Microsoft%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('Google', 13);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Google' WHERE `commonName` LIKE '%Google%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('TrustWave', 14);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'TrustWave' WHERE `commonName` LIKE '%TrustWave%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('Verizon', 15);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Verizon' WHERE `commonName` LIKE '%Verizon%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('Amazon', 16);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'Amazon' WHERE `commonName` LIKE '%Amazon%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('US DOD', 17);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'US DOD' WHERE `commonName` LIKE '%DOD%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('SECOM', 18);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'SECOM' WHERE `commonName` LIKE '%SECOM%';

INSERT INTO `company` (`companyName`, `companyID`) VALUES ('TWCA', 19);
INSERT INTO `issuer_company` (`issuerID`, `companyID`) SELECT issuerID, companyID FROM `issuer` JOIN `company` ON `companyName` = 'TWCA' WHERE `commonName` LIKE '%TWCA%';

