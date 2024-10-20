CREATE OR ALTER VIEW vAllDoctors
AS
	SELECT *
	FROM DOCTORS
GO

CREATE OR ALTER VIEW vExpDoctors
AS
	SELECT drExp
	FROM DOCTORS
GO

CREATE OR ALTER VIEW vSumExpPerHospital
AS
	SELECT H.hName, SUM(D.drExp) AS sumExp
	FROM DOCTORS D
	INNER JOIN PRACTICES_AT PA ON D.DId = PA.DId
	INNER JOIN HOSPITALS H ON PA.HId = H.HId
	GROUP BY H.HId, H.hName
GO

CREATE OR ALTER VIEW vCityRegionPairs
AS
	SELECT L.laCity, R.region
	FROM LOCAL_AGENCIES L
	INNER JOIN REGIONAL_AGENCIES R ON L.RId = R.RId
GO

SELECT *
FROM vCityRegionPairs


