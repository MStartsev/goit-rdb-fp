-- Створення таблиці для країн
CREATE TABLE IF NOT EXISTS pandemic.countries (
    entity_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Code VARCHAR(10) UNIQUE,
    Entity VARCHAR(255) NOT NULL UNIQUE
);

-- Вставка унікальних значень у таблицю countries
INSERT INTO 
    pandemic.countries (Code, Entity)
SELECT DISTINCT 
    Code, Entity 
FROM 
    pandemic.infectious_cases;

-- Створення таблиці для інфекційних захворювань
CREATE TABLE IF NOT EXISTS pandemic.infections (
    infectious_case_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    entity_id INT,
    Year YEAR,
    Number_yaws INT NULL,
    polio_cases INT,
    cases_guinea_worm FLOAT,
    Number_rabies FLOAT,
    Number_malaria FLOAT,
    Number_hiv FLOAT,
    Number_tuberculosis FLOAT,
    Number_smallpox INT,
    Number_cholera_cases INT,
    FOREIGN KEY (entity_id) REFERENCES pandemic.countries(entity_id)
);

-- Вставка даних у таблицю infections
INSERT INTO 
    pandemic.infections (
        entity_id, 
        Year, 
        Number_yaws, 
        polio_cases, 
        cases_guinea_worm, 
        Number_rabies, 
        Number_malaria, 
        Number_hiv, 
        Number_tuberculosis, 
        Number_smallpox, 
        Number_cholera_cases)
SELECT 
    c.entity_id, 
    ic.Year, 
    NULLIF(ic.Number_yaws, ''), 
    NULLIF(ic.polio_cases, ''), 
    NULLIF(ic.cases_guinea_worm, ''), 
    NULLIF(ic.Number_rabies, ''), 
    NULLIF(ic.Number_malaria, ''), 
    NULLIF(ic.Number_hiv, ''), 
    NULLIF(ic.Number_tuberculosis, ''), 
    NULLIF(ic.Number_smallpox, ''), 
    NULLIF(ic.Number_cholera_cases, '')
FROM 
    pandemic.infectious_cases AS ic
JOIN 
    pandemic.countries AS c ON ic.Code = c.Code;
