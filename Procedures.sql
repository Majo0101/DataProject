CREATE PROCEDURE Mileage_Month_Valacsay(IN inputMonth INT)
BEGIN
    SELECT * FROM TripLog WHERE months_id = inputMonth;
END;

CREATE PROCEDURE EXPENSES_MONTH_YEAR(IN inputMonth INT, IN inputYear INT)
BEGIN
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
    WHERE ExpensesLog.months_id = inputMonth
      AND Years.year = inputYear
    ORDER BY ExpensesLog.id;
END;


