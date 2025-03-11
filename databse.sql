CREATE DATABASE croneJOBS;
USE croneJOBS;

CREATE TABLE source_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE destination_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL
);

-- ALTER TABLE destination_table MODIFY id INT AUTO_INCREMENT;

INSERT INTO source_table (name, age) VALUES
('Alice', 25), ('Bob', 30), ('Charlie', 22), ('David', 28), ('Eve', 35),
('Frank', 40), ('Grace', 27), ('Hank', 32), ('Ivy', 29), ('Jack', 31),
('Kim', 26), ('Leo', 38), ('Mia', 24), ('Nathan', 33), ('Olivia', 37),
('Paul', 23), ('Quincy', 45), ('Rachel', 41), ('Steve', 36), ('Tina', 39),
('Uma', 34), ('Victor', 28), ('Wendy', 26), ('Xander', 30), ('Yvonne', 42),
('Zack', 29), ('Adam', 27), ('Bella', 31), ('Chris', 25), ('Diana', 30),
('Ethan', 23), ('Fiona', 36), ('George', 32), ('Hannah', 33), ('Ian', 29),
('Julia', 40), ('Kevin', 38), ('Laura', 26), ('Mike', 37), ('Nina', 22),
('Oscar', 45), ('Pam', 27), ('Quinn', 35), ('Ron', 34), ('Sara', 28),
('Tom', 39), ('Ursula', 30), ('Vince', 33), ('Walter', 24), ('Xena', 29),
('Yuri', 31), ('Zoe', 25), ('Aaron', 27), ('Bianca', 32), ('Carl', 26),
('Denise', 38), ('Edward', 29), ('Faith', 30), ('Gavin', 33), ('Hazel', 24),
('Isaac', 40), ('Jasmine', 41), ('Kyle', 36), ('Liam', 31), ('Mona', 23),
('Noah', 39), ('Olga', 34), ('Peter', 28), ('Queenie', 30), ('Ryan', 37),
('Sophia', 26), ('Travis', 35), ('Ulysses', 32), ('Vera', 28), ('Wesley', 29),
('Ximena', 27), ('Yasir', 40), ('Zelda', 36), ('Albert', 30), ('Beatrice', 22),
('Caleb', 29), ('Daphne', 33), ('Elliot', 25), ('Felicia', 35), ('Greg', 31),
('Harriet', 26), ('Ibrahim', 32), ('Joy', 28), ('Ken', 34), ('Luna', 40),
('Moses', 23), ('Nancy', 38), ('Omar', 27), ('Penelope', 39), ('Quentin', 30),
('Rose', 33), ('Sam', 31), ('Tessa', 25), ('Umar', 28), ('Vincent', 36);


SELECT * FROM source_table;
SELECT * FROM destination_table;



SHOW VARIABLES LIKE 'max_connections';
SET GLOBAL max_connections = 200;



