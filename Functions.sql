CREATE FUNCTION IsLastMonthOfYear() RETURNS INT(11)
BEGIN
    DECLARE curMonth INT DEFAULT 0;
    DECLARE maxYear INT DEFAULT 0;
    DECLARE curYear INT DEFAULT 0;
    DECLARE dump INT DEFAULT 0;
    SELECT GetCurrentMonth() INTO curMonth;
    SELECT GetMaxYear() INTO maxYear;
    SELECT GetCurrentYear() INTO curYear;
    IF (maxYear = curYear) AND (curMonth = 12) THEN
        SELECT IncrementYear() INTO dump;
    END IF;
    RETURN NULL;
END;


CREATE FUNCTION IncrementYear() RETURNS INT(11)
BEGIN
	DECLARE yr INT;
	SELECT YEAR(CURDATE()) INTO yr;
	INSERT INTO AdeptusMechanicus_5.Years (`year`) VALUES(yr+1) ;
	RETURN 0;
END;


CREATE FUNCTION GetMaxYear() RETURNS INT(11)
    DETERMINISTIC
BEGIN
    DECLARE max_year INT;
    SELECT MAX(YEAR) INTO max_year FROM Years;
    RETURN max_year;
END;


CREATE FUNCTION GetCurrentYear() RETURNS INT(11)
BEGIN
	DECLARE cur_year INT;
	SELECT YEAR(CURDATE()) INTO cur_year;
	RETURN cur_year;
END;


CREATE FUNCTION GetCurrentMonth() RETURNS INT(11)
BEGIN
	DECLARE cur_month INT;
	SELECT MONTH(CURDATE()) INTO cur_month;
	RETURN cur_month;
END;