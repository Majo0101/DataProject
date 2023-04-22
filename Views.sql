CREATE OR REPLACE VIEW EMPLOYEES_MOBILE_PLANS AS
SELECT Employees.first_name AS FirstName,
       Employees.last_name  AS LastName,
       MobilePlans.plan     AS MobilePlan,
       MobilePlans.price    AS Price,
       Jobs.job             AS Job
FROM Employees
         INNER JOIN Employees_MobilePlans
                    ON Employees_MobilePlans.employees_id = Employees.id
         INNER JOIN MobilePlans
                    ON Employees_MobilePlans.mobilePlans_id = MobilePlans.id
         INNER JOIN Employees_Jobs
                    ON Employees_Jobs.employees_id = Employees.id
         INNER JOIN Jobs
                    ON Employees_Jobs.jobs_id = Jobs.id;


CREATE OR REPLACE VIEW EXPENSES_LOG AS
SELECT ExpensesLog.id                  AS ID,
       Employees.first_name            AS FirstName,
       Employees.last_name             AS LastName,
       Jobs.job                        AS Job,
       Months.Month                    AS inMonth,
       Years.year                      AS inYear,
       Expenses.expense                AS Expense,
       CONCAT(ExpensesLog.price, ' €') AS Price
FROM ExpensesLog
         INNER JOIN Employees
                    ON Employees.id = employees_id
         INNER JOIN Employees_Jobs
                    ON Employees.id = Employees_Jobs.employees_id
         INNER JOIN Jobs
                    ON Employees_Jobs.jobs_id = Jobs.id
         INNER JOIN Countries
                    ON Countries.id = countries_id
         INNER JOIN Months
                    ON ExpensesLog.months_id = Months.id
         INNER JOIN Years
                    ON ExpensesLog.Years_id = Years.id
         INNER JOIN Expenses
                    ON ExpensesLog.expenses_id = Expenses.id
ORDER BY ExpensesLog.id;


CREATE OR REPLACE VIEW EXPENSE_BY_JOB AS
SELECT Employees.first_name                                                 AS first_name,
       Employees.last_name                                                  AS last_name,
       Jobs.job                                                             AS job,
       Cars.car                                                             AS car,
       Fuels.fuel                                                           AS fuel,
       Cars.consumption                                                     AS consumption,
       round(((TripLog.mileage * Cars.consumption) / 100) * Fuels.price, 0) AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Network Engineer'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW TRIP_LOG_CURRENT_YEAR AS
select Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Months.Month         AS month,
       TripLog.mileage      AS mileage,
       Cars.car             AS car,
       Cars.consumption     AS consumption,
       Fuels.fuel           AS fuel,
       Fuels.price          AS price,
       Years.year           AS year,
       ROUND(TripLog.mileage * Cars.consumption / 100,
       2)                    AS TripCost
FROM TripLog
         JOIN Cars_Fuels
             ON TripLog.cars_id = Cars_Fuels.cars_id
         JOIN Cars
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Cars_Fuels.fuels_id = Fuels.id
         JOIN Employees_Jobs
              ON TripLog.employees_id = Employees_Jobs.employees_id
         JOIN Employees
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Employees_Jobs.jobs_id = Jobs.id
         JOIN Months
              ON TripLog.months_id = Months.id
         JOIN Years ON TripLog.Years_id = Years.id
WHERE Years.year = (SELECT year(CURDATE())) ORDER BY TripLog.id;


CREATE OR REPLACE VIEW TRIP_LOG_2022 AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Months.Month         AS month,
       TripLog.mileage      AS mileage,
       Cars.car             AS car,
       Cars.consumption     AS consumption,
       Fuels.fuel           AS fuel,
       Fuels.price          AS price,
       Years.year           AS year,
       ROUND(TripLog.mileage * Cars.consumption / 100,
             2)             AS TripCost
FROM TripLog
         JOIN Cars_Fuels
              ON TripLog.cars_id = Cars_Fuels.cars_id
         JOIN Cars
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Cars_Fuels.fuels_id = Fuels.id
         JOIN Employees_Jobs
              ON TripLog.employees_id = Employees_Jobs.employees_id
         JOIN Employees
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Employees_Jobs.jobs_id = Jobs.id
         JOIN Months
              ON TripLog.months_id = Months.id
         JOIN Years
              ON TripLog.Years_id = Years.id
WHERE Years.year = 2022
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW TRIP_LOG AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Months.Month         AS month,
       TripLog.mileage      AS mileage,
       Cars.car             AS car,
       Cars.consumption     AS consumption,
       Fuels.fuel           AS fuel,
       Fuels.price          AS price,
       Years.year           AS year,
       ROUND(TripLog.mileage * Cars.consumption / 100,
             2)             AS TripCost
FROM TripLog
         JOIN Cars_Fuels
              ON TripLog.cars_id = Cars_Fuels.cars_id
         JOIN Cars
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Cars_Fuels.fuels_id = Fuels.id
         JOIN Employees_Jobs
              ON TripLog.employees_id = Employees_Jobs.employees_id
         JOIN Employees
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Employees_Jobs.jobs_id = Jobs.id
         JOIN Months
              ON TripLog.months_id = Months.id
         JOIN Years
              ON TripLog.Years_id = Years.id
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_UX_Designer AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       round(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'UX Designer'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_Software_Development_Manager AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Software Development Manager'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_Software_Architect AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       round(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Software Architect'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_Security_Engineer AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Security Engineer'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_Resource_Manager AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Resource Manager'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_Project_Manager AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Project Manager'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_Project_Lead AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Project Lead'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_Production_Engineer AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Production Engineer'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_network_engineer AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS CenaCesty
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Network Engineer'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_IT_Consultant AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'IT_Consultant'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_Development_Team_Lead AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Development Team Lead'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_Database_Administrator AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Database Administrator'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_Data_Analyst AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Data Analyst'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW Trip_cost_by_Chief_Technology_Officer AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       ROUND(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'Chief Technology Officer CTO'
ORDER BY TripLog.id;


CREATE OR REPLACE VIEW MILEAGE_CNG AS
SELECT TRIP_LOG_CURRENT_YEAR.fuel AS fuel, sum(TRIP_LOG_CURRENT_YEAR.mileage) AS summileage
FROM TRIP_LOG_CURRENT_YEAR
WHERE TRIP_LOG_CURRENT_YEAR.fuel = 'CNG';


CREATE OR REPLACE VIEW MILEAGE_Diesel AS
SELECT TRIP_LOG_CURRENT_YEAR.fuel AS fuel, sum(TRIP_LOG_CURRENT_YEAR.mileage) AS summileage
FROM TRIP_LOG_CURRENT_YEAR
WHERE TRIP_LOG_CURRENT_YEAR.fuel = 'Diesel';


CREATE OR REPLACE VIEW MILEAGE_LPG AS
SELECT TRIP_LOG_CURRENT_YEAR.fuel AS fuel, sum(TRIP_LOG_CURRENT_YEAR.mileage) AS summileage
FROM TRIP_LOG_CURRENT_YEAR
WHERE TRIP_LOG_CURRENT_YEAR.fuel = 'LPG';


CREATE OR REPLACE VIEW MILEAGE_Petrol AS
SELECT TRIP_LOG_CURRENT_YEAR.fuel AS fuel, sum(TRIP_LOG_CURRENT_YEAR.mileage) AS summileage
FROM TRIP_LOG_CURRENT_YEAR
WHERE TRIP_LOG_CURRENT_YEAR.fuel = 'Petrol';


CREATE OR REPLACE VIEW MOBILE_PLANS_CURRENT_YEAR AS
SELECT SUM((MobilePlans.price * (select month(CURDATE())))) AS `Mobile Cost 2023`
FROM Employees_MobilePlans
         JOIN Employees
              ON Employees_MobilePlans.employees_id = Employees.id
         JOIN MobilePlans
              ON Employees_MobilePlans.mobilePlans_id = MobilePlans.id;


CREATE OR REPLACE VIEW MOBILE_PLANS_SUM_2022 AS
SELECT sum(MobilePlans.price * 12) AS `Mobile Cost 2022`
FROM Employees_MobilePlans
         JOIN Employees
              ON Employees_MobilePlans.employees_id = Employees.id
         JOIN MobilePlans
              ON Employees_MobilePlans.mobilePlans_id = MobilePlans.id;


CREATE OR REPLACE VIEW MOBILE_PLANS_SUM_LIFETIME AS
SELECT SUM((`MobilePlans`.`price` * (SELECT PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM CURDATE()),
       EXTRACT(YEAR_MONTH FROM '2022-01-01')) AS `months_passed`))) AS `Mobile Cost LIFETIME`
FROM Employees_MobilePlans
         JOIN Employees
              ON Employees_MobilePlans.employees_id = Employees.id
         JOIN MobilePlans
              ON Employees_MobilePlans.mobilePlans_id = MobilePlans.id;


CREATE OR REPLACE VIEW MOST_USED_CAR AS
SELECT Cars.id AS id, Cars.car AS car, count(0) AS trips
FROM Cars
         JOIN Cars_Fuels
              ON Cars.id = Cars_Fuels.cars_id
         JOIN Fuels
              ON Cars_Fuels.fuels_id = Fuels.id
         JOIN TripLog
              ON Cars.id = TripLog.cars_id
group by Cars.id
ORDER BY trips DESC
LIMIT 1;


CREATE OR REPLACE VIEW `Trip_cost_by_CEO/Managing Director` AS
SELECT Employees.first_name AS first_name,
       Employees.last_name  AS last_name,
       Jobs.job             AS job,
       Cars.car             AS car,
       Fuels.fuel           AS fuel,
       Cars.consumption     AS consumption,
       round(TripLog.mileage * Cars.consumption / 100 * Fuels.price,
             0)             AS TripCost
FROM TripLog
         JOIN Employees
              ON Employees.id = TripLog.employees_id
         JOIN Employees_Jobs
              ON Employees_Jobs.employees_id = Employees.id
         JOIN Jobs
              ON Jobs.id = Employees_Jobs.jobs_id
         JOIN Cars
              ON Cars.id = TripLog.cars_id
         JOIN Cars_Fuels
              ON Cars_Fuels.cars_id = Cars.id
         JOIN Fuels
              ON Fuels.id = Cars_Fuels.fuels_id
WHERE Jobs.job = 'CEO/Managing Director'
ORDER BY TripLog.id;
