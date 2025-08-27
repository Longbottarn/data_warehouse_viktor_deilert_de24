SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS demo_db;

USE DATABASE DEMO_DB;

SHOW SCHEMAS;

CREATE SCHEMA IF NOT EXISTS demo_db.staging;

SHOW SCHEMAS IN demo_db;

CREATE TABLE IF NOT EXISTS customer (
    customer_id integer PRIMARY KEY,
    age integer,
    email varchar(50)
);

SHOW TABLES;


SELECT * FROM CUSTOMER;


INSERT INTO CUSTOMER (customer_id, age, email)
VALUES
    (1, 32, 'abc@gmail.com'),
    (1, 23, 'cdc@gmail.com');


SELECT * FROM customer;

DROP DATABASE DEMO_DB;

SHOW DATABASES;