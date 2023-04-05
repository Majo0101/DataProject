SET
FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Jobs;
CREATE TABLE Jobs
(
    id     INTEGER AUTO_INCREMENT,
    job    VARCHAR(255) NOT NULL,
    salary INTEGER      NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (job)
);

DROP TABLE IF EXISTS Fuels;
CREATE TABLE Fuels
(
    id    INTEGER AUTO_INCREMENT,
    fuel  VARCHAR(255) NOT NULL,
    price INTEGER      NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (fuel)
);

DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars
(
    id         INTEGER AUTO_INCREMENT,
    car        VARCHAR(255) NOT NULL,
    consumption FLOAT        NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (car)
);

DROP TABLE IF EXISTS MobilePlans;
CREATE TABLE MobilePlans
(
    id    INTEGER AUTO_INCREMENT,
    plan  VARCHAR(255) NOT NULL,
    price INTEGER      NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (plan)
);

DROP TABLE IF EXISTS Months;
CREATE TABLE Months
(
    id      INTEGER AUTO_INCREMENT,
    inMonth VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (inMonth)
);

DROP TABLE IF EXISTS TotalCosts;
CREATE TABLE TotalCosts
(
    id   INTEGER AUTO_INCREMENT,
    cost VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    id    INTEGER AUTO_INCREMENT,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL,
    age   INTEGER      NOT NULL,
    email VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Cars_Fuels;
CREATE TABLE Cars_Fuels
(
    cars_id  INTEGER NOT NULL,
    fuels_id INTEGER NOT NULL,
    UNIQUE KEY (cars_id),
    FOREIGN KEY (cars_id) REFERENCES Cars (id),
    FOREIGN KEY (fuels_id) REFERENCES Fuels (id)
);

DROP TABLE IF EXISTS Employees_Jobs;
CREATE TABLE Employees_Jobs
(
    employees_id INTEGER NOT NULL,
    jobs_id      INTEGER NOT NULL,
    UNIQUE KEY (employees_id),
    FOREIGN KEY (employees_id) REFERENCES Employees (id),
    FOREIGN KEY (jobs_id) REFERENCES Jobs (id)
);

DROP TABLE IF EXISTS Employees_MobilePlans;
CREATE TABLE Employees_MobilePlans
(
    employees_id   INTEGER NOT NULL,
    mobilePlans_id INTEGER NOT NULL,
    UNIQUE KEY (employees_id),
    FOREIGN KEY (employees_id) REFERENCES Employees (id),
    FOREIGN KEY (mobilePlans_id) REFERENCES MobilePlans (id)
);

DROP TABLE IF EXISTS TripLog;
CREATE TABLE TripLog
(
    id           INTEGER AUTO_INCREMENT,
    employees_id INTEGER NOT NULL,
    cars_id      INTEGER NOT NULL,
    months_id    INTEGER NOT NULL,
    inYear       INTEGER NOT NULL,
    mileage      INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (employees_id) REFERENCES Employees (id),
    FOREIGN KEY (cars_id) REFERENCES Cars (id),
    FOREIGN KEY (months_id) REFERENCES Months (id)
);

SET
FOREIGN_KEY_CHECKS = 1;