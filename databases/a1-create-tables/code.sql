USE HospitalIntegrityAgencyDB
GO


DROP TABLE INVESTIGATES
DROP TABLE CASES
DROP TABLE PRACTICES_AT 
DROP TABLE HOSPITALS 
DROP TABLE PATIENTS 
DROP TABLE INSURANCE_PROVIDERS
DROP TABLE DOCTORS 
DROP TABLE AGENTS
DROP TABLE LOCAL_AGENCIES
DROP TABLE REGIONAL_AGENCIES

GO


CREATE TABLE REGIONAL_AGENCIES(
	RId INT PRIMARY KEY,
	region VARCHAR(20),
	noTerritories INT
)

CREATE TABLE LOCAL_AGENCIES(
	LId INT PRIMARY KEY,
	laCity VARCHAR(20),
	lBudget INT,
	RId INT REFERENCES REGIONAL_AGENCIES(RId)
)

CREATE TABLE AGENTS(
	AId INT PRIMARY KEY,
	aName VARCHAR(30),
	aExp INT,
	LId INT REFERENCES LOCAL_AGENCIES(LId),
	inBranchSince DATE
)

CREATE TABLE DOCTORS(
	DId INT PRIMARY KEY,
	drName VARCHAR(30),
	drExp INT
)

CREATE TABLE INSURANCE_PROVIDERS(
	IPId INT PRIMARY KEY,
	cost INT
)

CREATE TABLE PATIENTS(
	PId INT PRIMARY KEY,
	pName VARCHAR(30),
	patAge INT,
	IPId INT REFERENCES INSURANCE_PROVIDERS(IPId)
)

CREATE TABLE HOSPITALS(
	HId INT PRIMARY KEY,
	hCity VARCHAR(20),
	hCap INT
)

CREATE TABLE PRACTICES_AT(
	DId INT REFERENCES DOCTORS(DId),
	HId INT REFERENCES HOSPITALS(HId),
	paSince DATE,
	CONSTRAINT PK_DOCTORS_HOSPITALS_PRACTICES PRIMARY KEY (DId, HId)
)

CREATE TABLE CASES(
	CId INT PRIMARY KEY,
	cType VARCHAR(20),
	cSum INT,
	cDate DATE,
	DId INT REFERENCES DOCTORS(DId),
	HId INT REFERENCES HOSPITALS(HId),
	PId INT REFERENCES PATIENTS(PId),
	victimFiledComplaint BIT,
	CONSTRAINT FK_DOCTORS_HOSPITALS_CASES FOREIGN KEY (DId, HId) REFERENCES PRACTICES_AT(DId, HId)
)

CREATE TABLE INVESTIGATES(
	AId INT REFERENCES AGENTS(AId),
	CId INT REFERENCES CASES(CId),
	CONSTRAINT PK_AGENTS_CASES_INVESTIGATES PRIMARY KEY (AId, CId)
)

GO
