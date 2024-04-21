SELECT 
    pandemic_countries.Entity,
    AVG(pandemic_infections.Number_rabies) 
		AS avg_rabies,
    MIN(pandemic_infections.Number_rabies) 
		AS min_rabies,
    MAX(pandemic_infections.Number_rabies) 
		AS max_rabies,
    SUM(pandemic_infections.Number_rabies) 
		AS sum_rabies
FROM 
    pandemic.infections 
    AS pandemic_infections
JOIN
    pandemic.countries 
    AS pandemic_countries 
    ON pandemic_infections.entity_id = pandemic_countries.entity_id
WHERE 
    pandemic_infections.Number_rabies IS NOT NULL
GROUP BY 
    pandemic_infections.entity_id
ORDER BY 
    avg_rabies DESC
LIMIT 
    10;
