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

DROP TABLE IF EXISTS Expenses;
CREATE TABLE Expenses
(
    id      INTEGER AUTO_INCREMENT,
    expense VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (expense)
);

DROP TABLE IF EXISTS Countries;
CREATE TABLE Countries
(
    id      INTEGER AUTO_INCREMENT,
    country VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (country)
);

DROP TABLE IF EXISTS Years;
CREATE TABLE Years
(
    id     INTEGER AUTO_INCREMENT,
    year INTEGER NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (year)
);

DROP TABLE IF EXISTS Fuels;
CREATE TABLE Fuels
(
    id    INTEGER AUTO_INCREMENT,
    fuel  VARCHAR(255) NOT NULL,
    price FLOAT        NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (fuel)
);

DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars
(
    id          INTEGER AUTO_INCREMENT,
    car         VARCHAR(255) NOT NULL,
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
    Month VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (Month)
);

DROP TABLE IF EXISTS TotalCosts;
CREATE TABLE TotalCosts
(
    id                INT(11)     NOT NULL AUTO_INCREMENT,
    OperatingCostType VARCHAR(15) NOT NULL,
    OperatingCostSum  FLOAT       NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY OperatingCostType (OperatingCostType)
);

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees
(
    id    INTEGER AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
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
    Years_id     INTEGER NOT NULL,
    mileage      INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (employees_id) REFERENCES Employees (id),
    FOREIGN KEY (cars_id) REFERENCES Cars (id),
    FOREIGN KEY (months_id) REFERENCES Months (id),
    FOREIGN KEY (years_id) REFERENCES Years (id)
);

DROP TABLE IF EXISTS ExpensesLog;
CREATE TABLE ExpensesLog
(
    id           INTEGER AUTO_INCREMENT,
    employees_id INTEGER NOT NULL,
    countries_id INTEGER NOT NULL,
    expenses_id  INTEGER NOT NULL,
    months_id    INTEGER NOT NULL,
    Years_id     INTEGER NOT NULL,
    price        FLOAT   NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (employees_id) REFERENCES Employees (id),
    FOREIGN KEY (countries_id) REFERENCES Countries (id),
    FOREIGN KEY (expenses_id) REFERENCES Expenses (id),
    FOREIGN KEY (months_id) REFERENCES Months (id),
    FOREIGN KEY (years_id) REFERENCES Years (id)
);

SET
FOREIGN_KEY_CHECKS = 1;