-- Create Database if not exist
CREATE DATABASE IF NOT EXISTS AdeptusMechanicus_5;

-- To show databases
SHOW DATABASES;

USE AdeptusMechanicus_5;

-- Create users
CREATE USER 'User1'@'%' IDENTIFIED BY 'password';
CREATE USER 'User2'@'%' IDENTIFIED BY 'password';
CREATE USER 'User3'@'%' IDENTIFIED BY 'password';
CREATE USER 'User4'@'%' IDENTIFIED BY 'password';
CREATE USER 'User5'@'%' IDENTIFIED BY 'password';
CREATE USER 'User6'@'%' IDENTIFIED BY 'password';

-- Create ADMIN/ROOT privileges
GRANT ALL ON AdeptusMechanicus_5.* TO 'User1'@'%' WITH GRANT OPTION;

-- Create POWER USER
GRANT ALL PRIVILEGES ON AdeptusMechanicus_5.* TO 'User2'@'%';
GRANT ALL PRIVILEGES ON AdeptusMechanicus_5.* TO 'User3'@'%';

-- Create USERS
GRANT SELECT, INSERT, UPDATE, DELETE ON AdeptusMechanicus_5.* TO 'User4'@'%';

-- Create READ ONLY users
GRANT SELECT ON AdeptusMechanicus_5.* TO 'User5'@'%';
GRANT SELECT ON AdeptusMechanicus_5.* TO 'User6'@'%';

-- To view the privileges for example
SHOW GRANTS FOR 'User6'@'%';