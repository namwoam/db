SELECT Fname,
    Lname,
    DATE(Bdate, 'auto')
FROM EMPLOYEE
WHERE Fname LIKE "J%"