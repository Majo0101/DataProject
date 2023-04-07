CREATE EVENT Update_Years_Bodnar
ON SCHEDULE
    EVERY '1' YEAR
    STARTS '2022-01-01 00:00:00'
DO
BEGIN
    INSERT INTO Years (AdeptusMechanicus_5.Years.inYear)
    VALUES (YEAR(curdate()));
END;
