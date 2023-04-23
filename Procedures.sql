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


CREATE PROCEDURE ZeroProcedure()
BEGIN
	DECLARE dump INT DEFAULT 0;
	SELECT IsLastMonthOfYear() INTO dump;
END;


CREATE PROCEDURE UpdateMobilePlansCost()
BEGIN
    UPDATE TotalCosts
    SET OperatingCostSum = (SELECT * FROM MOBILE_PLANS_CURRENT_YEAR)
    WHERE OperatingCostType = 'MobilePlans';
END;


CREATE PROCEDURE UpdateFuelCost()
BEGIN
    UPDATE TotalCosts
    SET OperatingCostSum = (SELECT (SUM(tripcost)) FROM TRIP_LOG_CURRENT_YEAR)
    WHERE OperatingCostType = 'Fuels';
END;


CREATE PROCEDURE UpdateExpensesCost()
BEGIN
    UPDATE TotalCosts
    SET OperatingCostSum = (SELECT SUM(`Price (€)`) FROM EXPENSES_LOG_CURRENT_YEAR)
    WHERE OperatingCostType = 'Expenses';
END;


CREATE PROCEDURE Trip_Month(in mnth VARCHAR(15))
BEGIN
    SELECT SUM(mileage) FROM TRIP_LOG_CURRENT_YEAR WHERE month = mnth;
END;


CREATE PROCEDURE nahodneCislo(in maxCislo INT)
BEGIN
    SELECT ROUND(RAND() * maxCislo + 1);
END;


CREATE PROCEDURE IsLastMonthOfYear()
BEGIN
    DECLARE x INT DEFAULT 0;
    SELECT IF(((SELECT GetCurrentMonth() = 12) AND (SELECT GetMaxYear() = (SELECT GetCurrentYear()))),
              (SELECT IncrementYear()), 'No action needed');
END;