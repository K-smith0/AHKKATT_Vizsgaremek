INSERT INTO countries(`Alpha-code-2`,`Alpha-code-3`)
VALUES
('ZW','ZWE'),
('ZM','ZMB'),
('YE','YEM'),
('VI','VIR'),
('VN','VNM'),
('VE','VEN'),
('VA','VAT'),
('VU','VUT'),
('UZ','UZB'),
('UY','URY'),
('US','USA'),
('GB','GBR'),
('AE','ARE'),
('UA','UKR'),
('UG','UGA'),
('TV','TUV'),
('TM','TKM'),
('TR','TUR'),
('TN','TUN'),
('TT','TTO'),
('TO','TON'),
('TG','TGO'),
('TL','TLS'),
('TH','THA'),
('TZ','TZA'),
('TJ','TJK'),
('TW','TWN'),
('SY','SYR'),
('CH','CHE'),
('SE','SWE'),
('SZ','SWZ'),
('SR','SUR'),
('SD','SDN'),
('LK','LKA'),
('ES','ESP'),
('ZA','ZAF'),
('SO','SOM'),
('SB','SLB'),
('SI','SVN'),
('SK','SVK'),
('SG','SGP'),
('SL','SLE'),
('SC','SYC'),
('RS','SRB'),
('SN','SEN'),
('SA','SAU'),
('ST','STP'),
('SM','SMR'),
('WS','WSM'),
('VC','VCT'),
('LC','LCA'),
('KN','KNA'),
('RW','RWA'),
('RU','RUS'),
('RO','ROU'),
('RE','REU'),
('QA','QAT'),
('PR','PRI'),
('PT','PRT'),
('PL','POL'),
('PN','PCN'),
('PH','PHL'),
('PE','PER'),
('PY','PRY'),
('PG','PNG'),
('PA','PAN'),
('PS','PSE'),
('PW','PLW'),
('PK','PAK'),
('OM','OMN'),
('NO','NOR'),
('MP','MNP'),
('NG','NGA'),
('NE','NER'),
('NI','NIC'),
('NZ','NZL'),
('NC','NCL'),
('AN','ANT'),
('NL','NLD'),
('NP','NPL'),
('NR','NRU'),
('NA','NAM'),
('MM','MMR'),
('MZ','MOZ'),
('MA','MAR'),
('MS','MSR'),
('ME','MNE'),
('MN','MNG'),
('MC','MCO'),
('MD','MDA'),
('FM','FSM'),
('MX','MEX'),
('MU','MUS'),
('MR','MRT'),
('MQ','MTQ'),
('MH','MHL'),
('MT','MLT'),
('ML','MLI'),
('MV','MDV'),
('MY','MYS'),
('MW','MWI'),
('MG','MDG'),
('LU','LUX'),
('LT','LTU'),
('LI','LIE'),
('LY','LBY'),
('LR','LBR'),
('LS','LSO'),
('LB','LBN'),
('LV','LVA'),
('LA','LAO'),
('KG','KGZ'),
('KW','KWT'),
('XK','XKX'),
('KR','KOR'),
('KP','PRK'),
('KI','KIR'),
('KE','KEN'),
('KZ','KAZ'),
('JO','JOR'),
('JP','JPN'),
('IT','ITA'),
('IL','ISR'),
('IE','IRL'),
('IQ','IRQ'),
('IR','IRN'),
('ID','IDN'),
('IN','IND'),
('IS','ISL'),
('HU','HUN'),
('HN','HND'),
('HT','HTI'),
('GW','GNB'),
('GT','GTM'),
('GU','GUM'),
('GP','GLP'),
('GD','GRD'),
('GL','GRL'),
('GR','GRC'),
('GH','GHA'),
('DE','DEU'),
('GE','GEO'),
('GM','GMB'),
('GA','GAB'),
('PF','PYF'),
('GF','GUF'),
('FR','FRA'),
('FI','FIN'),
('FJ','FJI'),
('FO','FRO'),
('ET','ETH'),
('EE','EST'),
('ER','ERI'),
('GQ','GNQ'),
('SV','SLV'),
('EG','EGY'),
('EC','ECU'),
('DO','DOM'),
('DM','DMA'),
('DJ','DJI'),
('DK','DNK'),
('CZ','CZE'),
('CY','CYP'),
('CU','CUB'),
('HR','HRV'),
('CI','CIV'),
('CR','CRI'),
('CD','COD'),
('CG','COG'),
('KM','COM'),
('CO','COL'),
('MO','MAC'),
('HK','HKG'),
('CN','CHN'),
('CL','CHL'),
('TD','TCD'),
('CF','CAF'),
('CV','CPV'),
('CA','CAN'),
('CM','CMR'),
('KH','KHM'),
('BI','BDI'),
('BF','BFA'),
('BG','BGR'),
('BN','BRN'),
('VG','VGB'),
('BR','BRA'),
('BW','BWA'),
('BA','BIH'),
('BO','BOL'),
('BT','BTN'),
('BM','BMU'),
('BJ','BEN'),
('BZ','BLZ'),
('BE','BEL'),
('BY','BLR'),
('BB','BRB'),
('BD','BGD'),
('BH','BHR'),
('BS','BHS'),
('AZ','AZE'),
('AT','AUT'),
('AU','AUS'),
('AW','ABW'),
('AM','ARM'),
('AR','ARG'),
('AG','ATG'),
('AI','AIA'),
('AO','AGO'),
('AD','AND'),
('AS','ASM'),
('DZ','DZA'),
('AL','ALB'),
('AF','AFG')
ON DUPLICATE KEY UPDATE
	`Alpha-code-2`=VALUES(`Alpha-code-2`)
;