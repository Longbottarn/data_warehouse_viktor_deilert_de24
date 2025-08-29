SHOW DATABASES;

-- Switch to appropriate role 

USE ROLE SYSADMIN;


--SET UP DATABASES FOR DLT CSV DATA INGESTION

CREATE DATABASE IF NOT EXISTS MOVIES1;

USE DATABASE MOVIES1;


--set up staging schema

CREATE SCHEMA staging;
--alternative use 'fully qualified object name' CREATE SCHEMA movies.staging; 




