
--Oracle��

CREATE TABLE tblRegister(
	id VARCHAR2(20 BYTE) NOT NULL PRIMARY KEY,
	pwd VARCHAR2(20 BYTE) NOT NULL,
	name CHAR(15 BYTE) NULL,
	num1 CHAR(6 BYTE) NULL,
	num2 CHAR(7 BYTE) NULL,
	email VARCHAR2(30 BYTE) NULL,
	phone VARCHAR2(30 BYTE) NULL,
	zipcode CHAR(5 BYTE) NULL,
	address VARCHAR2(60 BYTE) NULL,
	job VARCHAR2(30 BYTE) NULL
);


--MSSQL��

CREATE TABLE tblRegister(
	id VARCHAR(20) NOT NULL PRIMARY KEY,
	pwd VARCHAR(20) NOT NULL,
	name CHAR(15) NULL,
	num1 CHAR(6) NULL,
	num2 CHAR(7) NULL,
	email VARCHAR(30) NULL,
	phone VARCHAR(30) NULL,
	zipcode CHAR(5) NULL,
	address VARCHAR(60) NULL,
	job VARCHAR(30) NULL
);