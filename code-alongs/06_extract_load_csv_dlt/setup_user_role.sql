--switch to an appropriate role to create user and role
USE ROLE USERADMIN;

--create dlt user
CREATE USER IF NOT EXISTS extract_loader
    PASSWORD = 'extract_loader_password123'
    DEFAULT_WAREHOUSE = DEV_WH;


-- create dlt role
--(optional) drop role if already exists
--DROP ROLE movies_dlt_role;
CREATE ROLE movies1_dlt_role;

GRANT ROLE movies1_dlt_role TO USER extract_loader;

--switch to appropriate role to grant privilages to role and grant role to user
USE ROLE SECURITYADMIN;

-- granting role to user
GRANT ROLE MOVIES1_READER TO USER extract_loader;

--grant privilages to role
-- this role need to use warehouse, db, schema
GRANT USAGE ON WAREHOUSE DEV_WH TO ROLE movies1_dlt_role;
GRANT USAGE ON DATABASE movies TO ROLE movies1_dlt_role;
GRANT USAGE ON SCHEMA movies.staging TO ROLE movies1_dlt_role;

-- this role needs some special usages for the db and schema
GRANT CREATE TABLE ON SCHEMA movies1.staging TO ROLE movies1_dlt_role;

GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA movies1.staging TO ROLE movies1_dlt_role;

GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA movies1.staging TO ROLE movies1_dlt_role;


SHOW GRANTS TO ROLE movies1_dlt_role;

USE ROLE USERADMIN;
CREATE ROLE IF NOT EXISTS movies1_reader;

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE movies1_reader;


GRANT USAGE ON DATABASE movies1 TO ROLE movies1_reader;

GRANT USAGE ON SCHEMA movies1.staging TO ROLE movies1_reader;

GRANT SELECT ON ALL TABLES IN SCHEMA movies1.staging TO ROLE movies1_reader;

GRANT SELECT ON FUTURE TABLES IN SCHEMA movies1.staging TO ROLE movies1_reader;

GRANT SELECT ON FUTURE TABLES IN SCHEMA movies1.staging TO ROLE movies1_reader;

GRANT ROLE movies1_reader TO USER VDeilert;

SHOW GRANTS TO ROLE movies1_reader;


