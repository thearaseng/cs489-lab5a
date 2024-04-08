-- Dentists table
CREATE TABLE Dentists (
    DentistID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactPhone VARCHAR(20),
    Email VARCHAR(100),
    Specialization VARCHAR(100)
);

-- Patients table
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactPhone VARCHAR(20),
    Email VARCHAR(100),
    MailingAddress VARCHAR(255),
    DateOfBirth DATE
);

-- Location table
CREATE TABLE Location (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Telephone VARCHAR(20)
);

-- Surgeries table referencing Location
CREATE TABLE Surgeries (
    SurgeryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    LocationID INT,
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- Appointments table referencing Dentists, Patients, and Location
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    DentistID INT,
    PatientID INT,
    SurgeryID INT,
    AppointmentDateTime DATETIME,
    FOREIGN KEY (DentistID) REFERENCES Dentists(DentistID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (SurgeryID) REFERENCES Surgeries(SurgeryID)
);




-- Insert dummy data into Dentists table
INSERT INTO Dentists (FirstName, LastName, ContactPhone, Email, Specialization) VALUES
('John', 'Smith', '123-456-7890', 'john.smith@example.com', 'General Dentistry'),
('Emily', 'Jones', '456-789-0123', 'emily.jones@example.com', 'Orthodontics'),
('Michael', 'Johnson', '789-012-3456', 'michael.johnson@example.com', 'Pediatric Dentistry');

-- Insert dummy data into Patients table
INSERT INTO Patients (FirstName, LastName, ContactPhone, Email, MailingAddress, DateOfBirth) VALUES
('Alice', 'Brown', '321-654-9870', 'alice.brown@example.com', '123 Main St, City, State, Zip', '1990-05-15'),
('David', 'Wilson', '654-987-0123', 'david.wilson@example.com', '456 Elm St, City, State, Zip', '1985-10-20'),
('Sophia', 'Miller', '987-012-3456', 'sophia.miller@example.com', '789 Oak St, City, State, Zip', '2000-02-28');

-- Insert dummy data into Location table
INSERT INTO Location (Name, Address, Telephone) VALUES
('Southwest Dental Clinic', '123 Elm St, City, State, Zip', '555-123-4567'),
('Westside Dental Center', '456 Oak St, City, State, Zip', '555-234-5678'),
('Central Dental Care', '789 Pine St, City, State, Zip', '555-345-6789');

-- Insert dummy data into Surgeries table
INSERT INTO Surgeries (Name, LocationID) VALUES
('Southwest Dental Clinic', 1),
('Westside Dental Center', 2),
('Central Dental Care', 3);

-- Insert dummy data into Appointments table
INSERT INTO Appointments (DentistID, PatientID, SurgeryID, AppointmentDateTime) VALUES
(1, 1, 1, '2024-04-10 09:00:00'),
(2, 2, 2, '2024-04-11 10:00:00'),
(3, 3, 3, '2024-04-12 11:00:00');
