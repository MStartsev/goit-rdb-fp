DROP FUNCTION IF EXISTS year_difference;

DELIMITER //

CREATE FUNCTION year_difference(input_year YEAR) RETURNS INT 
DETERMINISTIC
BEGIN 
    DECLARE start_of_year, current__date DATE; 
    DECLARE year_diff INT; 
    
    SET start_of_year = MAKEDATE(input_year, 1); 
    SET current__date = CURDATE(); 
    SET year_diff = TIMESTAMPDIFF(YEAR, start_of_year, current__date); 
    
    RETURN year_diff; 
END//

DELIMITER ;


SELECT 
    pandemic_infections.Year,
    year_difference(pandemic_infections.Year) 
        AS year_difference
FROM 
    pandemic.infections 
        AS pandemic_infections;
