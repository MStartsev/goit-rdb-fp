SELECT
    pandemic_infections.Year,
    MAKEDATE(pandemic_infections.Year, 1) 
		AS date_infections,
    CURDATE() 
		AS current__date,
    TIMESTAMPDIFF(YEAR, MAKEDATE(pandemic_infections.Year, 1), CURDATE()) 
		AS year_difference
FROM 
     pandemic.infections 
		AS pandemic_infections;
   
