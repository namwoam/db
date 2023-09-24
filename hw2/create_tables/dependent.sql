 Create Table DEPENDENT (
    Essn CHAR(9) Not Null,
    Dependent_name VARCHAR(15) Not Null,
    Sex CHAR,
    Bdate DATE,
    Relationship VARCHAR(8),
    Primary Key(Essn, Dependent_name),
    Foreign Key(Essn) References EMPLOYEE(Ssn)
)