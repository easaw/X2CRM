DROP TABLE IF EXISTS `x2_contacts`,`x2_subscribe_contacts`;
/*&*/
CREATE TABLE `x2_contacts` (
	id						INT				UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name					VARCHAR(200),
	firstName				VARCHAR(80)		NOT NULL,
	lastName				VARCHAR(80)		NOT NULL,
	title					VARCHAR(100),
	company					VARCHAR(250),
	phone					VARCHAR(40),
	phone2					VARCHAR(40),
	email					VARCHAR(250),
	website					VARCHAR(250),
	address					VARCHAR(250),
	address2				VARCHAR(250),
	city					VARCHAR(40),
	state					VARCHAR(40),
	zipcode					VARCHAR(20),
	country					VARCHAR(40),
	visibility				INT NOT NULL,
	assignedTo				VARCHAR(20),
	backgroundInfo			TEXT,
	twitter					VARCHAR(20)		NULL,
	linkedin				VARCHAR(100)	NULL,
	skype					VARCHAR(32)		NULL,
	googleplus				VARCHAR(100)	NULL,
	lastUpdated				BIGINT,
	lastActivity			BIGINT,
	updatedBy				VARCHAR(20),
	priority				VARCHAR(40),
	leadSource				VARCHAR(40),
	leadDate				BIGINT,
	rating					TINYINT,
	createDate				BIGINT,
	facebook				VARCHAR(100)	NULL,
	otherUrl				VARCHAR(100)	NULL,
	leadtype				VARCHAR(250),
	closedate				BIGINT,
	interest				VARCHAR(250),
	leadstatus				VARCHAR(250),
	dealvalue				FLOAT,
	leadscore				INT,
	dealstatus				VARCHAR(250),
	timezone				VARCHAR(250)	NULL,
	doNotCall				TINYINT			DEFAULT 0,
	doNotEmail				TINYINT			DEFAULT 0,
	trackingKey				VARCHAR(32),
	dupeCheck				INT			DEFAULT 0,
	INDEX (email),
	INDEX (assignedTo)
) COLLATE = utf8_general_ci;
/*&*/
CREATE TABLE x2_subscribe_contacts(
	contact_id				INT				UNSIGNED,
	user_id					INT				UNSIGNED
) COLLATE = utf8_general_ci;
/*&*/
INSERT INTO `x2_modules`
			(`name`,			title,			visible, 	menuPosition,	searchable,	editable,	adminOnly,	custom,	toggleable)
	VALUES	("contacts",		"Contacts",			1,			1,				1,			1,			0,			0,		0);
/*&*/
INSERT INTO x2_fields
(modelName,			fieldName,				attributeLabel,	 modified,	custom,	type,		required,	readOnly,  linkType,   searchable,	isVirtual,	relevance)
VALUES
("Contacts",		"leadscore",			"Lead Score",			0,		0,	"rating",		0,			0,		NULL,			0,		0,			""),
("Contacts",		"dealstatus",			"Deal Status",			0,		0,	"dropdown",		0,			0,		"105",			0,		0,			""),
("Contacts",		"id",					"ID",					0,		0,	"varchar",		0,			0,		NULL,			0,		0,			""),
("Contacts",		"name",					"Full Name",			0,		0,	"varchar",		0,			0,		NULL,			1,		0,			"High"),
("Contacts",		"firstName",			"First Name",			0,		0,	"varchar",		1,			0,		NULL,			1,		0,			"High"),
("Contacts",		"lastName",				"Last Name",			0,		0,	"varchar",		1,			0,		NULL,			1,		0,			"High"),
("Contacts",		"title",				"Title",				0,		0,	"varchar",		0,			0,		NULL,			0,		0,			""),
("Contacts",		"company",				"Account",				0,		0,	"link",			0,			0,		"Accounts",		0,		0,			""),
("Contacts",		"phone",				"Phone",				0,		0,	"phone",		0,			0,		NULL,			1,		0,			"Medium"),
("Contacts",		"phone2",				"Phone 2",				0,		0,	"phone",		0,			0,		NULL,			1,		0,			"Medium"),
("Contacts",		"email",				"Email",				0,		0,	"email",		0,			0,		NULL,			1,		0,			"Medium"),
("Contacts",		"website",				"Website",				0,		0,	"url",			0,			0,		NULL,			0,		0,			""),
("Contacts",		"twitter",				"Twitter",				0,		0,	"url",			0,			0,		"twitter",		0,		0,			""),
("Contacts",		"linkedin",				"Linkedin",				0,		0,	"url",			0,			0,		"linkedin",	 	0,		0,				""),
("Contacts",		"skype",				"Skype",				0,		0,	"url",			0,			0,		"skype",		0,		0,			""),
("Contacts",		"googleplus",			"Googleplus",			0,		0,	"url",			0,			0,		"googleplus",	0,		0,			""),
("Contacts",		"address",				"Address",				0,		0,	"varchar",		0,			0,		NULL,			1,		0,			"Medium"),
("Contacts",		"address2",				"Address 2",			0,		0,	"varchar",		0,			0,		NULL,			1,		0,			"Medium"),
("Contacts",		"city",					"City",					0,		0,	"varchar",		0,			0,		NULL,			1,		0,			"Medium"),
("Contacts",		"state",				"State",				0,		0,	"varchar",		0,			0,		NULL,			1,		0,			"Medium"),
("Contacts",		"zipcode",				"Postal Code",			0,		0,	"varchar",		0,			0,		NULL,			1,		0,			"Medium"),
("Contacts",		"country",				"Country",				0,		0,	"varchar",		0,			0,		NULL,			1,		0,			"Medium"),
("Contacts",		"visibility",			"Visibility",			0,		0,	"visibility",	1,			0,		NULL,			0,		0,			""),
("Contacts",		"assignedTo",			"Assigned To",			0,		0,	"assignment",	0,			0,		NULL,			0,		0,			""),
("Contacts",		"backgroundInfo",		"Background Info",		0,		0,	"text",			0,			0,		NULL,			1,		0,			"Medium"),
("Contacts",		"lastUpdated",			"Last Updated",			0,		0,	"dateTime",		0,			1,		NULL,			0,		0,			""),
("Contacts",		"lastActivity",			"Last Activity",		0,		0,	"dateTime",		0,			1,		NULL,			0,		0,			""),
("Contacts",		"updatedBy",			"Updated By",			0,		0,	"varchar",		0,			1,		NULL,			0,		0,			""),
("Contacts",		"leadSource",			"Lead Source",			0,		0,	"dropdown",		0,			0,		"103",			0,		0,			""),
("Contacts",		"leadDate",				"Lead Date",			0,		0,	"date",			0,			0,		NULL,			0,		0,			""),
("Contacts",		"priority",				"Priority",				0,		0,	"varchar",		0,			0,		NULL,			0,		0,			""),
("Contacts",		"rating",				"Confidence",			0,		0,	"rating",		0,			0,		NULL,			0,		0,			""),
("Contacts",		"createDate",			"Create Date",			0,		0,	"dateTime",		0,			1,		NULL,			0,		0,			""),
("Contacts",		"facebook",				"Facebook",				0,		0,	"url",			0,			0,		"facebook",	 	0,		0,			""),
("Contacts",		"otherUrl",				"Other",				0,		0,	"url",			0,			0,		NULL,			0,		0,			""),
("Contacts",		"leadtype",				"Lead Type",			0,		0,	"dropdown",		0,			0,		"102",			0,		0,			""),
("Contacts",		"closedate",			"Close Date",			0,		0,	"date",			0,			0,		NULL,			0,		0,			""),
("Contacts",		"interest",				"Interest",				0,		0,	"varchar",		0,			0,		NULL,			0,		0,			""),
("Contacts",		"dealvalue",			"Deal Value",			0,		0,	"currency",		0,			0,		NULL,			0,		0,			""),
("Contacts",		"leadstatus",			"Lead Status",			0,		0,	"dropdown",		0,			0,		"104",			0,		0,			""),
("Contacts",		"doNotCall",			"Do Not Call",			0,		0,	"boolean",		0,			0,		NULL,			0,		0,			""),
("Contacts",		"timezone",             "Timezone",             0,		0,	"varchar",		0,			0,		NULL,			0,		0,			""),
("Contacts",		"dupeCheck",			"Duplicate Check",		0,		0,	"boolean",		0,			0,		NULL,			0,		0,			""),
("Contacts",		"doNotEmail",			"Do Not Email",			0,		0,	"boolean",		0,			0,		NULL,			0,		0,			""),
("Contacts",		"trackingKey",			"Web Tracking Key",		0,		0,	"varchar",		0,			0,		NULL,			0,		0,			"");