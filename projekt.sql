SET
FOREIGN_KEY_CHECKS = 0;

-- CREATE TABLE Pozicie (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     pozicia VARCHAR(255) UNIQUE NOT null,
--     cena_prace INTEGER not null
-- );

DROP TABLE IF EXISTS Jobs;
CREATE TABLE Jobs
(
    id     INTEGER AUTO_INCREMENT,
    job    VARCHAR(255) NOT NULL,
    salary INTEGER      NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (job)
);

-- CREATE TABLE Paliva (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     palivo VARCHAR(255) UNIQUE NOT null,
--     cena FLOAT not null
-- );

DROP TABLE IF EXISTS Fuels;
CREATE TABLE Fuels
(
    id    INTEGER AUTO_INCREMENT,
    fuel  VARCHAR(255) NOT NULL,
    price INTEGER      NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (fuel)
);

-- CREATE TABLE Auta (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     znacka VARCHAR(20) UNIQUE NOT null,
--     spotreba FLOAT not null
-- );

DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars
(
    id         INTEGER AUTO_INCREMENT,
    car        VARCHAR(255) NOT NULL,
    consumption FLOAT        NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (car)
);

-- CREATE TABLE Pausaly (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     pausal VARCHAR(255) UNIQUE NOT null,
--     cena INTEGER not null
-- );

DROP TABLE IF EXISTS MobilePlans;
CREATE TABLE MobilePlans
(
    id    INTEGER AUTO_INCREMENT,
    plan  VARCHAR(255) NOT NULL,
    price INTEGER      NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (plan)
);


-- create table mesiace (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     mesiac VARCHAR(10) not null
-- );


DROP TABLE IF EXISTS Months;
CREATE TABLE Months
(
    id      INTEGER AUTO_INCREMENT,
    inMonth VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY (inMonth)
);

-- create table celkove_naklady (
-- 	id INTEGER AUTO_INCREMENT PRIMARY KEY,
-- 	vysledok INT
-- );

DROP TABLE IF EXISTS TotalCosts;
CREATE TABLE TotalCosts
(
    id   INTEGER AUTO_INCREMENT,
    cost VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- CREATE TABLE Zamestnanci (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(255) NOT NULL,
--     last_name VARCHAR(255) NOT NULL,
--     age INT NOT NULL,
--     email VARCHAR(255) NOT NULL
-- );


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

-- CREATE TABLE Auto_Palivo (
--     auto_id INTEGER UNIQUE NOT null,
--     palivo_id INTEGER NOT null,
--     foreign key (auto_id) references Auta(id),
--     foreign key (palivo_id) references Paliva(id)
-- );

DROP TABLE IF EXISTS Cars_Fuels;
CREATE TABLE Cars_Fuels
(
    cars_id  INTEGER NOT NULL,
    fuels_id INTEGER NOT NULL,
    UNIQUE KEY (cars_id),
    FOREIGN KEY (cars_id) REFERENCES Cars (id),
    FOREIGN KEY (fuels_id) REFERENCES Fuels (id)
);


-- create table zamestnanci_pozicia (
-- zamestnanec_id INT unique not null,
-- pozicia_id INT not null,
-- foreign key (zamestnanec_id) references zamestnatci(id),
-- foreign key (pozicia_id) references pozicie(id)
-- );


DROP TABLE IF EXISTS Employees_Jobs;
CREATE TABLE Employees_Jobs
(
    employees_id INTEGER NOT NULL,
    jobs_id      INTEGER NOT NULL,
    UNIQUE KEY (employees_id),
    FOREIGN KEY (employees_id) REFERENCES Employees (id),
    FOREIGN KEY (jobs_id) REFERENCES Jobs (id)
);

-- create table zamestnanci_pausaly (
-- zamestnanec_id INT unique not null,
-- pausal_id INT not null,
-- foreign key (zamestnanec_id) references zamestnatci(id),
-- foreign key (pausal_id) references pausaly(id)
-- );

DROP TABLE IF EXISTS Employees_MobilePlans;
CREATE TABLE Employees_MobilePlans
(
    employees_id   INTEGER NOT NULL,
    mobilePlans_id INTEGER NOT NULL,
    UNIQUE KEY (employees_id),
    FOREIGN KEY (employees_id) REFERENCES Employees (id),
    FOREIGN KEY (mobilePlans_id) REFERENCES MobilePlans (id)
);

-- CREATE TABLE KnihaJazd (
--     id INTEGER AUTO_INCREMENT PRIMARY KEY,
--     zamestnanec_id INT NOT null,
--     auto_id INTEGER NOT null,
--     mesiac_id INTEGER not null,
--     rok INTEGER not null,
--     dlzka_cesty INTEGER not null,
--     FOREIGN KEY (zamestnanec_id) REFERENCES Zamestnatnci(id),
--     FOREIGN KEY (auto_id) REFERENCES Auto_Palivo(auto_id),
--     foreign key (mesiac_id) references mesiace(id)
-- );

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