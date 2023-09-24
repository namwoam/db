 Create Table PROJECT (
    Pname VARCHAR(15) Not Null,
    Pnumber INT Not Null,
    Plocation VARCHAR(15),
    Dnum INT Not Null,
    Primary Key(Pnumber),
    Unique(Pname),
    Foreign Key(Dnum) References DEPARTMENT(Dnumber)
)