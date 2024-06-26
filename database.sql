USE [master]
GO
/****** Object:  Database [FashionManagement]   *****/
CREATE DATABASE ExchangeRate;
GO
USE ExchangeRate;
GO
CREATE TABLE tblCurrency (
    code VARCHAR(3) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255),
    rate DECIMAL(10, 4) NOT NULL
);
GO
INSERT INTO tblCurrency (code, name, description, rate)
VALUES
    ('EUR', 'Euro', 'European Euro', 0.8925),
    ('CAD', 'Canadian Dollar', 'Canadian Dollar', 1.2658),
    ('CHF', 'Swiss Franc', 'Swiss Franc', 0.9247),
    ('CNY', 'Chinese Yuan', 'Chinese Yuan Renminbi', 6.3559),
    ('SEK', 'Swedish Krona', 'Swedish Krona', 8.4721);
GO
CREATE TABLE tblUser (
    username VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);
GO
INSERT INTO tblUser (username, name, password)
VALUES
    ('jane', 'Jane Smith', 'jane'),
('bob', 'Bob Jackson', 'bob');
GO
