CREATE DATABASE IF NOT EXISTS autentifikacija CHARACTER SET utf8 COLLATE utf8_general_ci;

USE autentifikacija;

CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username  VARCHAR(20) NOT NULL UNIQUE,
    password  VARCHAR(64) NOT NULL, 
    salt VARCHAR(32) NOT NULL, /* dodatna sigurnost od 32 znaka koja se lijepi u bazu*/
    first_name VARCHAR(50) NULL,
    last_name VARCHAR(50) NULL,
    joined TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    role_id INT UNSIGNED NOT NULL
)ENGINE= INNOdb;

CREATE TABLE IF NOT EXISTS roles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32) NOT NULL, 
    permissions text NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINE= INNOdb;

CREATE TABLE IF NOT EXISTS cookies (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hash VARCHAR(64) NOT NULL, 
    user_id INT UNSIGNED NOT NULL  
)ENGINE= INNOdb;

ALTER TABLE users ADD FOREIGN KEY (role_id) REFERENCES roles(id);
ALTER TABLE cookies ADD FOREIGN KEY (user_id) REFERENCES users(id);