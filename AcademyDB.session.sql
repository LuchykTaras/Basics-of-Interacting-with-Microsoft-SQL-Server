-- 1. Створення бази даних (якщо потрібно)
-- CREATE DATABASE Academy;
-- GO
-- USE Academy;
-- GO

-- Видаляємо таблиці, якщо вони вже існують (для безпечного перезапуску скрипта)
USE Academy
DROP TABLE IF EXISTS Teachers;
DROP TABLE IF EXISTS Faculties;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Groups;

-- 2. Створення таблиці "Групи" (Groups)
CREATE TABLE Groups (
    Id INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(10) NOT NULL,
    Rating INT NOT NULL,
    Year INT NOT NULL,
    
    CONSTRAINT PK_Groups PRIMARY KEY (Id),
    CONSTRAINT UQ_Groups_Name UNIQUE (Name),
    CONSTRAINT CHK_Groups_Name_NotEmpty CHECK (Name <> ''),
    CONSTRAINT CHK_Groups_Rating CHECK (Rating BETWEEN 0 AND 5),
    CONSTRAINT CHK_Groups_Year CHECK (Year BETWEEN 1 AND 5)
);

-- 3. Створення таблиці "Кафедри" (Departments)
CREATE TABLE Departments (
    Id INT IDENTITY(1,1) NOT NULL,
    Financing MONEY NOT NULL DEFAULT 0,
    Name NVARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Departments PRIMARY KEY (Id),
    CONSTRAINT UQ_Departments_Name UNIQUE (Name),
    CONSTRAINT CHK_Departments_Name_NotEmpty CHECK (Name <> ''),
    CONSTRAINT CHK_Departments_Financing CHECK (Financing >= 0)
);

-- 4. Створення таблиці "Факультети" (Faculties)
CREATE TABLE Faculties (
    Id INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100) NOT NULL,
    
    CONSTRAINT PK_Faculties PRIMARY KEY (Id),
    CONSTRAINT UQ_Faculties_Name UNIQUE (Name),
    CONSTRAINT CHK_Faculties_Name_NotEmpty CHECK (Name <> '')
);

-- 5. Створення таблиці "Викладачі" (Teachers)
CREATE TABLE Teachers (
    Id INT IDENTITY(1,1) NOT NULL,
    EmploymentDate DATE NOT NULL,
    Name NVARCHAR(MAX) NOT NULL,
    Premium MONEY NOT NULL DEFAULT 0,
    Salary MONEY NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL,
    
    CONSTRAINT PK_Teachers PRIMARY KEY (Id),
    CONSTRAINT CHK_Teachers_EmploymentDate CHECK (EmploymentDate >= '1990-01-01'),
    CONSTRAINT CHK_Teachers_Name_NotEmpty CHECK (Name <> ''),
    CONSTRAINT CHK_Teachers_Surname_NotEmpty CHECK (Surname <> ''),
    CONSTRAINT CHK_Teachers_Premium CHECK (Premium >= 0),
    CONSTRAINT CHK_Teachers_Salary CHECK (Salary > 0)
);