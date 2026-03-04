 Enter password: **********
Welcome to the MySQL monitor.  Commands end with; or \g.
Your MySQL connection id is 68
Server version: 8.0.44 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

Database 
CREATE DATABASE smartroute;
USE smartroute;

User Table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
Location Table
CREATE TABLE location (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);
Vehicle Table
CREATE TABLE vehicle (
    id INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    mileage DOUBLE
);

Route Table
CREATE TABLE route (
    id INT PRIMARY KEY AUTO_INCREMENT,
    source_id INT,
    destination_id INT,
    distance DOUBLE,
    FOREIGN KEY (source_id) REFERENCES location(id),
    FOREIGN KEY (destination_id) REFERENCES location(id)
);

Booking Table
CREATE TABLE booking (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    route_id INT,
    vehicle_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (route_id) REFERENCES route(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);
