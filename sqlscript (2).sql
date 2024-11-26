REM   Script: ACITY GO DATABASE MANAGEMENT - 2
REM   Continuation using joins

CREATE TABLE Passenger ( 
    StudentID INT PRIMARY KEY, 
    Name VARCHAR(50), 
    PhoneNumber VARCHAR(10), 
    PassTIme VARCHAR(100), 
    ArrivalLocation VARCHAR(100), 
    DepatureLocation VARCHAR(100) 
);

SELECT * FROM Passenger;

INSERT INTO Passenger (StudentID, Name, PhoneNumber, PassTime, DepatureLocation, ArrivalLocation) 
VALUES (10022300071, 'Abbey Josavina', '0559876543', '4:35pm', 'ACITY', 'North Legon Junction');

SELECT * FROM Passenger;

INSERT INTO Passenger (StudentID, Name, PhoneNumber, PassTime, DepatureLocation, ArrivalLocation) 
VALUES (10022300139, 'Nyasembi Griselda', '0559876556', '1:35pm', 'ACITY', 'Aviation');

SELECT * FROM Passenger;

INSERT INTO Passenger (StudentID, Name, PhoneNumber, PassTime, DepatureLocation, ArrivalLocation) 
VALUES (10022300119, 'Koranteng Kwesi', '0559456543', '8:00pm', 'YODA', 'Ashongman');

SELECT * FROM Passenger;

INSERT INTO Passenger (StudentID, Name, PhoneNumber, PassTime, DepatureLocation, ArrivalLocation) 
VALUES (10022300129, 'Assan Kofi', '0552876543', '3:00am', 'Bliss Bite', 'East Legon');

SELECT * FROM Passenger;

CREATE TABLE Driver ( 
    DriverID INT PRIMARY KEY, 
    Name VARCHAR(50), 
    Phone_Number VARCHAR(15), 
    License_No VARCHAR(20) 
);

SELECT * FROM Driver;

INSERT INTO Driver (DriverID, Name, Phone_Number, License_No) 
VALUES (001,'Akuffo Addo', '0241234567', 'AKU-129384');

SELECT * FROM Driver;

INSERT INTO Driver (DriverID, Name, Phone_Number, License_No) 
VALUES (002,'Mahama John', '0241894567', 'MAH-2909384');

SELECT * FROM Driver;

INSERT INTO Driver (DriverID, Name, Phone_Number, License_No) 
VALUES (003,'Rawlings Jerry', '0541234567', 'RAW-129384');

SELECT * FROM Driver;

CREATE TABLE Vehicle ( 
    Plate_No VARCHAR(20) PRIMARY KEY, 
    Car_Type VARCHAR(50), 
    Colour VARCHAR(30), 
    Car_Level VARCHAR(20) 
);

SELECT * FROM Vehicle;

INSERT INTO Vehicle (Plate_No, Car_Type, Colour, Car_Level) 
VALUES ('GE7834-10', 'Kia Picanto', 'Blue', 'Economy');

SELECT * FROM Vehicle;

SELECT * FROM Vehicle;

INSERT INTO Vehicle (Plate_No, Car_Type, Colour, Car_Level) 
VALUES ('GE3434-21', 'Toyota Camry', 'Red', 'Comfort');

SELECT * FROM Passenger;

SELECT * FROM Driver;

SELECT * FROM Vehicle;

SELECT * FROM Vehicle;

INSERT INTO Vehicle (Plate_No, Car_Type, Colour, Car_Level) 
VALUES ('GW0234-24', 'Tesla X', 'Black', 'Go Premium!!');

SELECT * FROM Vehicle;

CREATE TABLE Route ( 
    Route_ID INT PRIMARY KEY, 
    Street_Name VARCHAR(100), 
    GPS VARCHAR(50), 
    Departure_Time VARCHAR(100), 
    Arrival_Time VARCHAR(100) 
);

SELECT * FROM Route;

SELECT * FROM Route;

INSERT INTO Route (Route_ID, Street_Name, GPS, Departure_Time, Arrival_Time) 
VALUES (1001,'Cosway Street', 'GA123', '7:00pm', '8:30pm');

SELECT * FROM Route;

INSERT INTO Route (Route_ID, Street_Name, GPS, Departure_Time, Arrival_Time) 
VALUES (1002,'Makafui Street', 'GA323', '3:00pm', '3:35pm');

SELECT * FROM Route;

INSERT INTO Route (Route_ID, Street_Name, GPS, Departure_Time, Arrival_Time) 
VALUES (1003,'Mukase Street', 'GA789', '3:00am', '5:38am');

SELECT * FROM Route;

CREATE TABLE RideDetails ( 
    RideID INT PRIMARY KEY, 
    DriverID INT, 
    Plate_No VARCHAR(20), 
    Departure_Time VARCHAR(100), 
    Arrival_Time VARCHAR(100), 
    Depature_Location VARCHAR(100), 
    Arrival_Location VARCHAR(100), 
    FOREIGN KEY (DriverID) REFERENCES Driver(DriverID), 
    FOREIGN KEY (Plate_No) REFERENCES Vehicle(Plate_No) 
);

SELECT * FROM RideDetails;

INSERT INTO RideDetails (RideID, Departure_Time,  Arrival_Time,  Arrival_Location, Depature_Location) 
VALUES (010,'07:15:00', '07:45:00', 'North Legon', 'Academic City');

SELECT * FROM RideDetails;

SELECT * FROM RideDetails WHERE RideID = 10;

UPDATE RideDetails 
SET DriverID = 001, Plate_No = 'GE7834-10' 
WHERE RideID = 010;

SELECT * FROM RideDetails ;

CREATE TABLE Payment ( 
    Payment_ID INT PRIMARY KEY , 
    RideID INT, 
    Payment_Type VARCHAR(20), 
    Amount INT, 
    Payment_Date VARCHAR(20), 
    FOREIGN KEY (RideID) REFERENCES RideDetails(RideID) 
);

SELECT * FROM Payment;

INSERT INTO Payment (Payment_ID, RideID, Payment_Type, Amount, Payment_Date) 
VALUES (233, 010, 'MoMo', 15, '2024-11-25');

SELECT * FROM Payment;

SELECT * FROM Payment;

SELECT * FROM Payment;

ALTER TABLE RideDetails  
ADD StudentID INT 
ADD FOREIGN KEY (StudentID) REFERENCES Passenger(StudentID);

SELECT  
    P.Name AS PassengerName,  
    R.Depature_Location,  
    R.Arrival_Location,  
    D.Name AS DriverName,  
    V.Car_Type,  
    Pay.Payment_Type,  
    Pay.Amount 
FROM  
    Passenger P 
JOIN  
    RideDetails R ON P.StudentID = R.StudentID 
JOIN  
    Driver D ON R.DriverID = D.DriverID 
JOIN  
    Vehicle V ON R.Plate_No = V.Plate_No 
JOIN  
    Payment Pay ON R.RideID = Pay.RideID;

INSERT INTO Passenger (StudentID, Name, PhoneNumber, PassTime, DepatureLocation, ArrivalLocation) 
VALUES (10022300151, 'Kofi Ford', '0559876567', '5:00pm', 'ACITY', 'DOWNTOWN');

INSERT INTO RideDetails (RideID, StudentID, DriverID, Plate_No, Departure_Time, Arrival_Time, Depature_Location, Arrival_Location) 
VALUES (011, 10022300151, 001, 'GE7834-22', '5:00pm', '5:30pm', 'ACITY', 'DOWNTOWN');

SELECT * FROM Passenger WHERE StudentID = 10022300151;

SELECT * FROM Driver WHERE DriverID = 001;

SELECT * FROM Vehicle WHERE Plate_No = 'GE7834-22';

INSERT INTO Vehicle (Plate_No, Car_Type, Colour, Car_Level) 
VALUES ('GE7834-22', 'Hyundai Accent', 'Gray', 'Economy');

INSERT INTO Passenger (StudentID, Name, PhoneNumber, PassTime, DepatureLocation, ArrivalLocation) 
VALUES (10022300151, 'Joel Kwameni', '0559876567', '5:00pm', 'ACITY', 'DOWNTOWN');

INSERT INTO RideDetails (RideID, StudentID, DriverID, Plate_No, Departure_Time, Arrival_Time, Depature_Location, Arrival_Location) 
VALUES (011, 10022300151, 001, 'GE7834-22', '5:00pm', '5:30pm', 'ACITY', 'DOWNTOWN');

SELECT  
    P.Name AS PassengerName,  
    R.Depature_Location,  
    R.Arrival_Location,  
    D.Name AS DriverName,  
    V.Car_Type,  
    Pay.Payment_Type,  
    Pay.Amount 
FROM  
    Passenger P 
JOIN  
    RideDetails R ON P.StudentID = R.StudentID 
JOIN  
    Driver D ON R.DriverID = D.DriverID 
JOIN  
    Vehicle V ON R.Plate_No = V.Plate_No 
JOIN  
    Payment Pay ON R.RideID = Pay.RideID;

SELECT * FROM Passenger;

SELECT * FROM RideDetails;

SELECT * FROM Passenger;

SELECT * FROM RideDetails;

SELECT * FROM Driver;

SELECT * FROM Vehicle;

SELECT * FROM Payment;

SELECT  
    P.Name AS PassengerName,  
    R.Depature_Location,  
    R.Arrival_Location 
FROM  
    Passenger P 
JOIN  
    RideDetails R ON P.StudentID = R.StudentID;

SELECT * FROM Passenger;

SELECT  
    P.Name AS PassengerName,  
    R.Depature_Location,  
    R.Arrival_Location 
FROM  
    Passenger P 
JOIN  
    RideDetails R ON P.StudentID = R.StudentID;

SELECT  
    R.Depature_Location,  
    R.Arrival_Location,  
    D.Name AS DriverName 
FROM  
    RideDetails R 
JOIN  
    Driver D ON R.DriverID = D.DriverID;

SELECT  
    R.Depature_Location,  
    V.Car_Type 
FROM  
    RideDetails R 
JOIN  
    Vehicle V ON R.Plate_No = V.Plate_No;

SELECT  
    R.RideID,  
    Pay.Payment_Type,  
    Pay.Amount 
FROM  
    RideDetails R 
JOIN  
    Payment Pay ON R.RideID = Pay.RideID;

SELECT  
    P.Name AS PassengerName,  
    R.Depature_Location,  
    R.Arrival_Location,  
    D.Name AS DriverName,  
    V.Car_Type,  
    Pay.Payment_Type,  
    Pay.Amount 
FROM  
    Passenger P 
JOIN  
    RideDetails R ON P.StudentID = R.StudentID 
JOIN  
    Driver D ON R.DriverID = D.DriverID 
JOIN  
    Vehicle V ON R.Plate_No = V.Plate_No 
JOIN  
    Payment Pay ON R.RideID = Pay.RideID;

INSERT INTO Payment (Payment_ID, RideID, Payment_Type, Amount, Payment_Date) 
VALUES (234, 011, 'Cash', 20, '2024-11-25');

INSERT INTO Vehicle (Plate_No, Car_Type, Colour, Car_Level) 
VALUES ('GE7834-22', 'Honda Civic', 'Gray', 'Comfort');

SELECT Plate_No FROM Vehicle;

INSERT INTO Vehicle (Plate_No, Car_Type, Colour, Car_Level) 
VALUES ('GE6704-22', 'Honda Civic', 'Violet', 'Comfort');

SELECT Plate_No FROM Vehicle;

SELECT  
    P.Name AS PassengerName,  
    R.Depature_Location,  
    R.Arrival_Location,  
    D.Name AS DriverName,  
    V.Car_Type,  
    Pay.Payment_Type,  
    Pay.Amount 
FROM  
    Passenger P 
JOIN  
    RideDetails R ON P.StudentID = R.StudentID 
JOIN  
    Driver D ON R.DriverID = D.DriverID 
JOIN  
    Vehicle V ON R.Plate_No = V.Plate_No 
JOIN  
    Payment Pay ON R.RideID = Pay.RideID;

SELECT  
    P.Name AS PassengerName,  
    R.Depature_Location,  
    R.Arrival_Location,  
    D.Name AS DriverName,  
    V.Car_Type,  
    Pay.Payment_Type,  
    Pay.Amount 
FROM  
    Passenger P 
JOIN  
    RideDetails R ON P.StudentID = R.StudentID 
JOIN  
    Driver D ON R.DriverID = D.DriverID 
JOIN  
    Vehicle V ON R.Plate_No = V.Plate_No 
JOIN  
    Payment Pay ON R.RideID = Pay.RideID;

