CREATE DATABASE IF NOT EXISTS dblogin;

USE dblogin;

CREATE TABLE privilege (
                           id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                           name VARCHAR(20) NOT NULL,
                           description TEXT,
                           privilege_level INT NOT NULL UNIQUE
);

INSERT INTO privilege (name, description, privilege_level)
VALUES
    ('ADMIN', 'Administrador do sistema', 1),
    ('USER', 'Usuário padrão do sistema', 2)
