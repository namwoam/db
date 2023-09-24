Create Table DEPARTMENT (
    Dname VARCHAR(15) Not Null,
    Dnumber INT Not Null,
    Mgr_ssn CHAR(9) Not Null,
    Mgr_start_date DATE,
    Primary Key(Dnumber),
    Unique(Dname),
    Foreign Key(Mgr_ssn) References EMPLOYEE(Ssn)
)