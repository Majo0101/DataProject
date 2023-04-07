CREATE PROCEDURE Mileage_Month_Valacsay(IN inputMonth INT)
BEGIN
    SELECT * FROM TripLog WHERE months_id = inputMonth;
END;

CREATE PROCEDURE Expenses_Month_Year_Bodnar(IN inputMonth INT, IN inputYear INT)
BEGIN
    SELECT ExpensesLog.id                  AS ID,
           Employees.fname                 AS FirstName,
           Employees.lname                 AS LastName,
           Jobs.job                        AS Job,
           Months.inMonth                  AS inMonth,
           Years.inYear                    AS inYear,
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
    WHERE ExpensesLog.months_id = inputMonth
      AND Years.inYear = inputYear
    ORDER BY ExpensesLog.id;
END;


# CALL Mileage_inMonth_Valacsay(2)
# for example