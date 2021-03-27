--<ScriptOptions statementTerminator=";"/>

CREATE TABLE users (
	UserId INT NOT NULL,
	Currentt VARCHAR(3) NOT NULL,
	Rolee VARCHAR(20) NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	PhoneNumber INT NOT NULL,
	email VARCHAR(255),
	password VARCHAR(255),
	PRIMARY KEY (UserId)
) ENGINE=InnoDB;

