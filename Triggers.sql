DROP TRIGGER IF EXISTS TriggerNewYear_EMPLOYEES;
CREATE TRIGGER TriggerNewYear_EMPLOYEES
    AFTER INSERT
    ON Employees
    FOR EACH ROW
    CALL ZeroProcedure();


DROP TRIGGER IF EXISTS UpdateExpenses;
CREATE TRIGGER UpdateExpenses
    AFTER INSERT
    ON ExpensesLog
    FOR EACH ROW
    UPDATE TotalCosts
    SET OperatingCostSum = (SELECT sum(`Price (€)`) FROM EXPENSES_LOG_CURRENT_YEAR)
    WHERE OperatingCostType = 'Expenses';


DROP TRIGGER IF EXISTS UpdateTotalFuelCost;
CREATE trigger UpdateTotalFuelCost
    AFTER INSERT
    ON TripLog
    FOR EACH ROW
    UPDATE TotalCosts
    SET OperatingCostSum = (SELECT (sum(tripcost)) FROM TRIP_LOG_CURRENT_YEAR)
    WHERE OperatingCostType = 'Fuels';


DROP TRIGGER IF EXISTS TriggerNewYear_TRIPLOG;
CREATE TRIGGER TriggerNewYear_TRIPLOG
    AFTER INSERT
    ON TripLog
    FOR EACH ROW
    CALL ZeroProcedure();