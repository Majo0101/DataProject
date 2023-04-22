DROP EVENT IF EXISTS UPDATE_YEARS_EVENT;
CREATE EVENT UPDATE_YEARS_EVENT
    ON SCHEDULE
        EVERY '1' YEAR
            STARTS '2022-01-01 00:00:00'
    DO
    BEGIN
        INSERT INTO Years (AdeptusMechanicus_5.Years.year)
        VALUES (YEAR(curdate()));
    END;


DROP EVENT IF EXISTS UpdateMobilePlans;
CREATE EVENT UpdateMobilePlans ON SCHEDULE
    EVERY '1' DAY
        STARTS '2023-04-20 16:27:45'
    ENABLE
    DO
    BEGIN
        UPDATE TotalCosts
        SET OperatingCostSum = (SELECT * FROM MOBILE_PLANS_CURRENT_YEAR)
        WHERE OperatingCostType = 'MobilePlans';
    END;