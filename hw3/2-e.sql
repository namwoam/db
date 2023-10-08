SELECT E.Ssn,
    COUNT(WO.Hours) as work_projects,
    SUM(
        CASE
            WHEN WO.Hours IS NULL THEN 0
            ELSE WO.Hours
        END
    ) as work_hours,
    COUNT(DISTINCT P.Plocation) as project_locations
FROM EMPLOYEE AS E
    LEFT JOIN WORKS_ON AS WO ON WO.Essn = E.Ssn
    AND WO.Hours IS NOT NULL
    LEFT JOIN PROJECT AS P ON WO.Pno = P.Pnumber
GROUP BY E.Ssn