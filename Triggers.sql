DROP TRIGGER IF EXISTS TripLog_trigger;
CREATE TRIGGER TripLog_trigger
    AFTER INSERT
    ON TripLog
    FOR EACH ROW
    UPDATE TotalCosts
    SET cost = (SELECT(SUM(mileage)) FROM TripLog)
    WHERE id = 1;
