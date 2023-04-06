INSERT INTO TotalCosts (cost, actual)
VALUES ('Payroll', 0),
       ('Fuel', 0),
       ('Bussines', 0);

INSERT INTO Cars (car, consumption)
VALUES ('Audi', 7.5),
       ('BMW', 7.8),
       ('Chevrolet', 9.3),
       ('Dodge', 12.5),
       ('Ford', 8.6),
       ('Honda', 6.9),
       ('Hyundai', 7.2),
       ('Jeep', 12.8),
       ('Kia', 7.4),
       ('Lexus', 8.2),
       ('Mazda', 7.6),
       ('Mercedes-Benz', 8.1),
       ('Nissan', 7.8),
       ('Porsche', 11.5),
       ('Subaru', 8.2),
       ('Sufurky', 3.1),
       ('Toyota', 7.2),
       ('Volkswagen', 7.1),
       ('Volvo', 7.5),
       ('Peugeot', 6.8);

INSERT INTO Fuels (fuel, price)
VALUES ('Petrol', 1.45),
       ('Diesel', 1.5),
       ('LPG', 0.65),
       ('CNG', 0.8);

INSERT INTO MobilePlans (plan, price)
VALUES ('30', 15),
       ('60', 20),
       ('90', 25),
       ('120', 30),
       ('Unlimited', 35);

INSERT INTO Months (inMonth)
VALUES ('January'),
       ('February'),
       ('March'),
       ('April'),
       ('May'),
       ('June'),
       ('July'),
       ('August'),
       ('September'),
       ('October'),
       ('November'),
       ('December');

INSERT INTO Years (inYear)
VALUES (2022),
       (2023);

INSERT INTO Countries (id, country)
VALUES
    (1, 'Slovakia'),
    (2, 'Germany'),
    (3, 'France'),
    (4, 'Italy'),
    (5, 'Spain'),
    (6, 'Netherlands'),
    (7, 'Belgium'),
    (8, 'Sweden'),
    (9, 'Denmark'),
    (10, 'Greece'),
    (11, 'Ireland'),
    (12, 'Portugal'),
    (13, 'Austria'),
    (14, 'Finland'),
    (15, 'Poland'),
    (16, 'Hungary');

INSERT INTO Expenses (id, expense)
VALUES
    (1, 'Meals with clients or business partners'),
    (2, 'Transportation costs'),
    (3, 'Lodging expenses'),
    (4, 'Conference fees and related expenses'),
    (5, 'Meals during work trips'),
    (6, 'Entertainment expenses for clients or business partners'),
    (7, 'Equipment rentals or purchases for work-related travel'),
    (8, 'Parking fees during work trips'),
    (9, 'Supplies for trade shows or conferences (e.g. brochures, promotional items)'),
    (10, 'Translation services for international business trips');

INSERT INTO Employees (fname, lname, age, email)
VALUES ('Branislav', 'Valacsay', 40, 'branislav.v@outlook.com'),
       ('Marian', 'Bodnar', 18, 'm_bodnar@gmail.com'),
       ('Milos', 'Vydareny', 41, 'milos.vydareny@paneurouni.com'),
       ('Nikita', 'Tomanec', 21, 'nikita_22@gmail.com'),
       ('Michal', 'Micuch', 30, 'michal_micuch@paneurouni.com');

INSERT INTO Jobs (job, salary)
VALUES ('CEO/Managing Director', 25000),
       ('Chief Technology Officer (CTO)', 18000),
       ('Software Development Manager', 17000),
       ('Project Manager', 16000),
       ('Software Architect', 15000),
       ('Network Engineer', 14000),
       ('Data Analyst', 13000),
       ('IT Consultant', 12000),
       ('Database Administrator', 11000),
       ('Security Engineer', 12500),
       ('Development Team Lead', 9000),
       ('Project Lead', 8000),
       ('Production Engineer', 7000),
       ('Resource Manager', 4000),
       ('UX Designer', 8500);

INSERT INTO Employees_Jobs (employees_id, jobs_id)
VALUES (1, 1),
       (2, 2),
       (3, 2),
       (4, 7),
       (5, 3);

# INSERT INTO Cars_Fuels (cars_id, fuels_id)
# VALUES (1, FLOOR(RAND() * 4) + 1);


# INSERT INTO Employees_Jobs (employees_id, jobs_id)
# VALUES (1, 1),
#        (2, 2),
#        (3, 2),
#        (4, 7),
#        (5, 3),
#        (6, FLOOR(RAND() * (15 - 3 + 1)) + 3);


# INSERT INTO Employees_MobilePlans (employees_id, mobilePlans_id)
# VALUES (1, FLOOR(RAND() * (5 - 1 + 1)) + 1);


# INSERT INTO TripLog (employees_id, cars_id, months_id, inYear, mileage)
# VALUES (ROUND(RAND() * 51) + 1, ROUND(RAND() * 19) + 1, ROUND(RAND() * 11) + 1, 2022,
#         FLOOR(RAND() * (500 - 30 + 1)) + 30);
