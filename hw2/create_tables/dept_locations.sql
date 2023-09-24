 Create Table DEPT_LOCATIONS (
    Dnumber INT Not Null,
    Dlocation VARCHAR(15) Not Null,
    Primary Key(Dnumber, Dlocation),
    Foreign Key(Dnumber) References DEPARTMENT(Dnumber)
)