Create Table EMPLOYEE (
    Fname VARCHAR(15) Not Null,
    Minit CHAR,
    Lname VARCHAR(15) Not Null,
    Ssn CHAR(9) Not Null,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR,
    Salary DECIMAL(10, 2),
    Super_ssn CHAR(9),
    Dno INT Not Null,
    Primary Key(Ssn)
)
