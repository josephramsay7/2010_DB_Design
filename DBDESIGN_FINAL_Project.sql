------------------------------------------------------------------------------------
-------------------------------------Scoring----------------------------------------
------------------------------------------------------------------------------------


IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dim' ) 
BEGIN
	EXEC sp_executesql N'CREATE SCHEMA dim AUTHORIZATION dbo;'
END
;

GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stg' ) 
BEGIN
	EXEC sp_executesql N'CREATE SCHEMA stg AUTHORIZATION dbo;'
END
;

GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'f' ) 
BEGIN
	EXEC sp_executesql N'CREATE SCHEMA f AUTHORIZATION dbo;'
END
;

GO

/*********************************************************/
/****************** Calendar DIM Script ******************/
/*********************************************************/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dim' AND TABLE_NAME = 'Calendar')
BEGIN
-- Create the Calendar table
CREATE TABLE dim.Calendar
(
    pkCalendar INT NOT NULL,
    DateValue DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
	Qtr VARCHAR(3) NOT NULL,
    Month INT NOT NULL,
    MonthName VARCHAR(10) NOT NULL,
	MonthShort VARCHAR(3) NOT NULL,
    Week INT NOT NULL,
    Day INT NOT NULL,
	DayName VARCHAR(10) NOT NULL,
	DayShort VARCHAR(3) NOT NULL,
    IsWeekday BIT NOT NULL,
	Weekday VARCHAR(3) NOT NULL
);

	ALTER TABLE dim.Calendar
	ADD CONSTRAINT PK_Calendar_Julian PRIMARY KEY(pkCalendar);

	ALTER TABLE dim.Calendar
    ADD CONSTRAINT UC_Calendar UNIQUE (DateValue);
END

GO

/*********************************************************/
/******************    Schema DDL       ******************/
/*********************************************************/

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'dim' ) 
BEGIN
	EXEC sp_executesql N'CREATE SCHEMA dim AUTHORIZATION dbo;'
END
;

GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stg' ) 
BEGIN
	EXEC sp_executesql N'CREATE SCHEMA stg AUTHORIZATION dbo;'
END
;

GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'f' ) 
BEGIN
	EXEC sp_executesql N'CREATE SCHEMA f AUTHORIZATION dbo;'
END
;

GO

/*********************************************************/
/****************** Calendar DIM Script ******************/
/*********************************************************/

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dim' AND TABLE_NAME = 'Calendar')
BEGIN
-- Create the Calendar table
CREATE TABLE dim.Calendar
(
    pkCalendar INT NOT NULL,
    DateValue DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
	Qtr VARCHAR(3) NOT NULL,
    Month INT NOT NULL,
    MonthName VARCHAR(10) NOT NULL,
	MonthShort VARCHAR(3) NOT NULL,
    Week INT NOT NULL,
    Day INT NOT NULL,
	DayName VARCHAR(10) NOT NULL,
	DayShort VARCHAR(3) NOT NULL,
    IsWeekday BIT NOT NULL,
	Weekday VARCHAR(3) NOT NULL
);

	ALTER TABLE dim.Calendar
	ADD CONSTRAINT PK_Calendar_Julian PRIMARY KEY(pkCalendar);

	ALTER TABLE dim.Calendar
    ADD CONSTRAINT UC_Calendar UNIQUE (DateValue);
END

GO