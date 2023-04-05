DROP VIEW IF EXISTS Employees_MobilePlans_View;
CREATE VIEW Employees_MobilePlans_View AS
SELECT Employees.fname   AS FirstName,
       Employees.lname   AS LastName,
       MobilePlans.plan  AS MobilePlan,
       MobilePlans.price AS Price,
       Jobs.job          AS Job
FROM Employees_MobilePlans
         INNER JOIN Employees
                    ON Employees_MobilePlans.employees_id = Employees.id
         INNER JOIN MobilePlans
                    ON Employees_MobilePlans.mobilePlans_id = MobilePlans.id
         INNER JOIN Employees_Jobs
                    ON Employees_MobilePlans.employees_id = Employees_Jobs.employees_id
         INNER JOIN Jobs
                    ON Employees_Jobs.employees_id = Jobs.id;


DROP VIEW IF EXISTS TripLog_View;
CREATE VIEW TripLog_View AS
SELECT Employees.fname                                     AS FirstName,
       Employees.lname                                     AS LastName,
       Jobs.job                                            AS Job,
       Months.inMonth                                      AS inMonth,
       TripLog.inYear                                      AS inYear,
       Cars.car                                            AS Car,
       Fuels.fuel                                          AS Fuel,
       Fuels.price                                         AS Price,
       Cars.consuption                                     AS Consuption,
       TripLog.mileage                                     AS Mileage,
       round((TripLog.mileage * Cars.consuption / 100), 2) AS TotalCosts
FROM TripLog
         INNER JOIN Cars_Fuels
                    ON TripLog.cars_id = Cars_Fuels.cars_id
         INNER JOIN Cars
                    ON Cars_Fuels.cars_id = Cars.id
         INNER JOIN Fuels
                    ON Cars_Fuels.fuels_id = Fuels.id
         INNER JOIN Employees_Jobs
                    ON TripLog.employees_id = Employees_Jobs.employees_id
         INNER JOIN Employees
                    ON Employees_Jobs.employees_id = Employees.id
         INNER JOIN Jobs
                    ON Employees_Jobs.jobs_id = Jobs.id
         INNER JOIN Months
                    ON TripLog.months_id = Months.id
ORDER BY TripLog.id