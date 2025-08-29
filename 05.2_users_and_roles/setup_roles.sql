USE ROLE USERADMIN;

CREATE ROLE ICE_CREAM_READER COMMENT = "Able to read ice_cream_db";

CREATE ROLE ICE_CREAM_WRITER COMMENT = "Able to do CRUD operations on ice_cream_db";

CREATE ROLE ICE_CREAM_ANALYST COMMENT = "Able to create views on ice_cream_db";

show roles;

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE ice_cream_reader;

GRANT USAGE ON DATABASE ice_cream_db TO ROLE ice_cream_reader;

GRANT USAGE ON ALL SCHEMAS IN DATABASE ice_cream_db TO ROLE ice_cream_reader;

-- read - SELECT

GRANT SELECT ON ALL TABLES IN SCHEMA ice_cream_db.public TO ice_cream_reader;

GRANT SELECT ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ice_cream_reader;


SHOW GRANTS TO ROLE ICE_CREAM_READER;

SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

GRANT ROLE ice_cream_reader TO ROLE ice_cream_writer;

SHOW GRANTS TO ROLE ICE_CREAM_WRITER;


GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ICE_CREAM_WRITER;

GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ICE_CREAM_WRITER;

GRANT CREATE TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

SHOW GRANTS TO ROLE ice_cream_writer;


SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

USE ROLE USERADMIN;

GRANT ROLE ice_cream_writer TO USER VDeilert;