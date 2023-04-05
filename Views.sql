CREATE VIEW Employees_MobilePlans_View AS
SELECT fname AS FirstName, lname AS LastName, plan AS MobilePlan, price AS Price, job AS Job
FROM Employees_MobilePlans
         INNER JOIN Employees
                    ON Employees_MobilePlans.employees_id = Employees.id
         INNER JOIN MobilePlans
                    ON Employees_MobilePlans.mobilePlans_id = MobilePlans.id
         INNER JOIN Employees_Jobs
                    ON Employees_MobilePlans.employees_id = Employees_Jobs.employees_id
         INNER JOIN Jobs
                    ON Employees_Jobs.employees_id = Jobs.id;


