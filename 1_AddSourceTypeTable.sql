-- Step 1: Create the T_DataSourceType table with the required fields
CREATE TABLE T_DataSourceType (
    DataSourceTypeId INT PRIMARY KEY,
    DataSourceTypeDesc NVARCHAR(50) NOT NULL
);

-- Step 2: Insert the required values into T_DataSourceType
INSERT INTO T_DataSourceType (DataSourceTypeId, DataSourceTypeDesc)
VALUES 
    (1, N'טעינה בלבד'),
    (2, N'טעינה ובדיקת פורמט'),
    (3, N'(טעינה ועיבוד (טעינה + בדיקת פורמט + בדיקות דאטה');

-- Step 3: Alter the TAB_ImportDataSource table to add new columns
-- and set up a foreign key relationship
ALTER TABLE TAB_ImportDataSource
ADD 
    DataSourceTypeId INT NOT NULL DEFAULT 3,       -- Mandatory field with default value of 3
    InsertDate DATETIME NOT NULL DEFAULT '2000-01-01', -- Mandatory field with default value of '2000-01-01'
    StartDate DATETIME NULL,                       -- Optional field

    TableName NVARCHAR(100) NULL;                  -- Optional field (adjust size as needed)

-- Step 4: Set up the foreign key constraint
-- Ensure DataSourceTypeId in TAB_ImportDataSource references DataSourceTypeId in T_DataSourceType
ALTER TABLE TAB_ImportDataSource
ADD CONSTRAINT FK_TAB_ImportDataSource_DataSourceType
    FOREIGN KEY (DataSourceTypeId) REFERENCES T_DataSourceType(DataSourceTypeId);

-- Step 5: Update existing records in TAB_ImportDataSource
-- Set DataSourceTypeId to 3, InsertDate to '2000-01-01', and StartDate to '2000-01-01' for all existing entries
UPDATE TAB_ImportDataSource
SET 
    DataSourceTypeId = 3,
    InsertDate = '2000-01-01',
    StartDate = '2000-01-01';
