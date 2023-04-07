CREATE PROCEDURE Mileage_inMonth_Valacsay(IN inMonth INT)
BEGIN
	SELECT * FROM TripLog WHERE months_id = inMonth;
END;

# CALL Mileage_inMonth_Valacsay(2)
# for example