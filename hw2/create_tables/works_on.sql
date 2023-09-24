 Create Table WORKS_ON (
    Essn CHAR(9) Not Null,
    Pno INT Not Null,
    Hours DECIMAL(3, 1) Not Null,
    Primary Key(Essn, Pno),
    Foreign Key(Essn) References EMPLOYEE(Ssn),
    Foreign Key(Pno) References PROJECT(Pnumber)
)