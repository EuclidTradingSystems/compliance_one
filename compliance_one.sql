-- CREATE TABLE user 
-- (
--     id INT AUTO_INCREMENT,
--     PRIMARY KEY(id),
--     username VARCHAR(63),
--     password VARCHAR(63),
--     user_type TINYINT UNSIGNED,
--     session_id UUID
-- )

-- CREATE TABLE product_group 
-- (
--     id INT AUTO_INCREMENT,
--     PRIMARY KEY(id),
--     name VARCHAR(63)
-- )

-- CREATE TABLE product 
-- (
--     id INT AUTO_INCREMENT,
--     PRIMARY KEY(id),
--     group_id INT NOT NULL,
--     CONSTRAINT FOREIGN KEY (group_id) REFERENCES product_group (id),
--     commodity VARCHAR(63),
--     risk_score TINYINT UNSIGNED
-- )

-- CREATE TABLE sovereignty
-- (
--     id INT AUTO_INCREMENT,
--     PRIMARY KEY(id),
--     name VARCHAR(63),
--     ranking TINYINT UNSIGNED,
--     fatf TINYINT UNSIGNED,
--     transparency TINYINT UNSIGNED,
--     world_bank TINYINT UNSIGNED
-- )

-- CREATE TABLE country 
-- (
--     id INT AUTO_INCREMENT,
--     PRIMARY KEY(id),
--     country_name VARCHAR(63),
--     official_state_name VARCHAR(63),
--     sovereignty_id INT NOT NULL,
--     CONSTRAINT FOREIGN KEY (sovereignty_id) REFERENCES sovereignty (id)
-- )

-- CREATE TABLE contact 
-- (
--     id INT AUTO_INCREMENT,
--     PRIMARY KEY(id),
--     family_name VARCHAR(63),
--     fore_names VARCHAR(63),
--     email VARCHAR(127),
--     phone VARCHAR(63),
--     address VARCHAR(63),
--     country VARCHAR(63),
--     zip MEDIUMINT UNSIGNED,
--     location VARCHAR(63)
-- )

DELETE FROM product_group WHERE name = 'test'