DROP TRIGGER IF EXISTS TripLog_trigger;
CREATE TRIGGER TripLog_trigger
    AFTER INSERT
    ON TripLog
    FOR EACH ROW
    UPDATE TotalCosts
    SET actual = (SELECT(SUM(mileage)) FROM TripLog)
    WHERE cost = 'Fuel';

