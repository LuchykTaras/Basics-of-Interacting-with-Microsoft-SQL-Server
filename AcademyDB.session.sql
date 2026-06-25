-- -- 1. Створення бази даних (якщо потрібно)
-- -- CREATE DATABASE Academy;
-- -- GO
-- -- USE Academy;
-- -- GO

-- -- Видаляємо таблиці, якщо вони вже існують (для безпечного перезапуску скрипта)
-- USE Academy
-- DROP TABLE IF EXISTS Teachers;
-- DROP TABLE IF EXISTS Faculties;
-- DROP TABLE IF EXISTS Departments;
-- DROP TABLE IF EXISTS Groups;

-- -- 2. Створення таблиці "Групи" (Groups)
-- CREATE TABLE Groups (
--     Id INT IDENTITY(1,1) NOT NULL,
--     Name NVARCHAR(10) NOT NULL,
--     Rating INT NOT NULL,
--     Year INT NOT NULL,
    
--     CONSTRAINT PK_Groups PRIMARY KEY (Id),
--     CONSTRAINT UQ_Groups_Name UNIQUE (Name),
--     CONSTRAINT CHK_Groups_Name_NotEmpty CHECK (Name <> ''),
--     CONSTRAINT CHK_Groups_Rating CHECK (Rating BETWEEN 0 AND 5),
--     CONSTRAINT CHK_Groups_Year CHECK (Year BETWEEN 1 AND 5)
-- );

-- -- 3. Створення таблиці "Кафедри" (Departments)
-- CREATE TABLE Departments (
--     Id INT IDENTITY(1,1) NOT NULL,
--     Financing MONEY NOT NULL DEFAULT 0,
--     Name NVARCHAR(100) NOT NULL,
    
--     CONSTRAINT PK_Departments PRIMARY KEY (Id),
--     CONSTRAINT UQ_Departments_Name UNIQUE (Name),
--     CONSTRAINT CHK_Departments_Name_NotEmpty CHECK (Name <> ''),
--     CONSTRAINT CHK_Departments_Financing CHECK (Financing >= 0)
-- );

-- -- 4. Створення таблиці "Факультети" (Faculties)
-- CREATE TABLE Faculties (
--     Id INT IDENTITY(1,1) NOT NULL,
--     Name NVARCHAR(100) NOT NULL,
    
--     CONSTRAINT PK_Faculties PRIMARY KEY (Id),
--     CONSTRAINT UQ_Faculties_Name UNIQUE (Name),
--     CONSTRAINT CHK_Faculties_Name_NotEmpty CHECK (Name <> '')
-- );

-- -- 5. Створення таблиці "Викладачі" (Teachers)
-- CREATE TABLE Teachers (
--     Id INT IDENTITY(1,1) NOT NULL,
--     EmploymentDate DATE NOT NULL,
--     Name NVARCHAR(MAX) NOT NULL,
--     Premium MONEY NOT NULL DEFAULT 0,
--     Salary MONEY NOT NULL,
--     Surname NVARCHAR(MAX) NOT NULL,
    
--     CONSTRAINT PK_Teachers PRIMARY KEY (Id),
--     CONSTRAINT CHK_Teachers_EmploymentDate CHECK (EmploymentDate >= '1990-01-01'),
--     CONSTRAINT CHK_Teachers_Name_NotEmpty CHECK (Name <> ''),
--     CONSTRAINT CHK_Teachers_Surname_NotEmpty CHECK (Surname <> ''),
--     CONSTRAINT CHK_Teachers_Premium CHECK (Premium >= 0),
--     CONSTRAINT CHK_Teachers_Salary CHECK (Salary > 0)
-- );

-- -- ==========================================
-- -- ЗАПОВНЕННЯ ТАБЛИЦІ "Факультети" (Faculties)
-- -- ==========================================
-- INSERT INTO Faculties (Name) VALUES 
-- ('Faculty of Magic'),               -- Факультет Магії
-- ('Faculty of Magic Items & Research'),-- Факультет Магічних предметів та досліджень
-- ('Faculty of Martial Arts'),        -- Факультет Бойових мистецтв (для воїнів в Академії)
-- ('Faculty of Language & History');   -- Факультет мов та історії світу

-- -- ==========================================
-- -- ЗАПОВНЕННЯ ТАБЛИЦІ "Кафедри" (Departments)
-- -- ==========================================
-- INSERT INTO Departments (Name, Financing) VALUES 
-- ('Water Magic Department', 35000.00),      -- Кафедра Магії Води (вітання Роксі!)
-- ('Fire & Earth Magic Department', 28000.00),-- Кафедра Магії Вогню та Землі
-- ('Summoning Magic Department', 42000.00),  -- Кафедра Магії Призову (де досліджували телепортацію)
-- ('Sword God Style Department', 12000.00),  -- Кафедра Стилю Бога Меча
-- ('Beast-God Language Department', 8500.00), -- Кафедра мови племені Звіролюдей
-- ('Software Development', 0.00);             -- Залишив цю кафедру суто під твій минулий запит №12, хоч це і не фентезі :)

-- -- ==========================================
-- -- ЗАПОВНЕННЯ ТАБЛИЦІ "Групи" (Groups)
-- -- Обмеження: Name (max 10 chars), Rating (0-5), Year (1-5)
-- -- ==========================================
-- INSERT INTO Groups (Name, Rating, Year) VALUES 
-- ('M-Water-1', 5, 1),  -- 1 курс, Магія води (Рудеус вчився б тут на початку)
-- ('M-Summ-5',  4, 5),  -- 5 курс, Призов (випускники, як Нанахосі та її помічники)
-- ('W-Sword-2', 3, 2),  -- 2 курс, Шлях меча (для Еріс, якби вона любила лекції)
-- ('B-Beast-3', 4, 3),  -- 3 курс, Звіролюди (група Лініі та Пурсени)
-- ('M-Fire-5',  2, 5);  -- 5 курс, Магія вогню (слабенький рейтинг для балансу)

-- -- ==========================================
-- -- ЗАПОВНЕННЯ ТАБЛИЦІ "Викладачі" (Teachers)
-- -- Обмеження: EmploymentDate >= '1990-01-01', Salary > 0, Premium >= 0
-- -- ==========================================
-- INSERT INTO Teachers (Name, Surname, EmploymentDate, Salary, Premium) VALUES 
-- -- Роксі Мігурдія (Професорка магії води)
-- ('Roxy', 'Migurdia', '2015-09-01', 1500.00, 450.00),

-- -- Рудеус Грейрат (Був як особливий студент/викладач, запишемо солідно)
-- ('Rudeus', 'Greyrat', '2020-02-15', 2500.00, 600.00),

-- -- Сайлент Се7ен (Нанахосі Шидзука — дослідниця призову)
-- ('Silent', 'Seven', '2012-04-10', 1800.00, 300.00),

-- -- Еліналіз Драгонроуд (Шукала пригоди, але нехай підробляє асистентом бойових мистецтв)
-- ('Elinalise', 'Dragonroad', '2021-11-01', 500.00, 180.00),

-- -- Кліфф Грімор (Геніальний магічний інженер, поки що молодий асистент)
-- ('Cliff', 'Grimore', '2022-03-01', 540.00, 150.00),

-- -- Джиніас Клейн (Директор Академії Раноа, ветеран магії)
-- ('Jenius', 'Halphas', '1995-08-20', 3000.00, 1000.00);

-- -- Додаємо колонку для посади в таблицю Teachers
-- ALTER TABLE Teachers 
-- ADD Position NVARCHAR(50) NOT NULL DEFAULT 'Assistant';