CREATE DATABASE computer_firm;
USE computer_firm;

CREATE TABLE Product (
    maker VARCHAR(50),
    model INT PRIMARY KEY,
    type VARCHAR(10) CHECK (type IN ('PC', 'Laptop', 'Printer'))
);

CREATE TABLE PC (
    code INT PRIMARY KEY,
    model INT,
    speed DECIMAL(5, 2),   -- швидкість процесора в мегагерцах
    ram INT,               -- об'єм пам'яті в мегабайтах
    hd DECIMAL(5, 2),      -- розмір диску в гігабайтах
    cd VARCHAR(10),        -- швидкість CD-приводу (наприклад, '4x')
    price DECIMAL(10, 2),  -- ціна
    FOREIGN KEY (model) REFERENCES Product(model)
);


CREATE TABLE Laptop (
    code INT PRIMARY KEY,
    model INT,
    speed DECIMAL(5, 2),   -- швидкість процесора в мегагерцах
    ram INT,               -- об'єм пам'яті в мегабайтах
    hd DECIMAL(5, 2),      -- розмір диску в гігабайтах
    screen DECIMAL(4, 2),  -- розмір екрану в дюймах
    price DECIMAL(10, 2),  -- ціна
    FOREIGN KEY (model) REFERENCES Product(model)
);

CREATE TABLE Printer (
    model INT PRIMARY KEY,
    color CHAR(1) CHECK (color IN ('y', 'n')), -- 'y' - кольоровий, 'n' - чорно-білий
    type VARCHAR(10) CHECK (type IN ('Laser', 'Jet', 'Matrix')), -- тип принтера
    price DECIMAL(10, 2),  -- ціна
    FOREIGN KEY (model) REFERENCES Product(model)
);
