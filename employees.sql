CREATE DATABASE employee_directory;

USE employee_directory;

CREATE TABLE people (
    id int auto_increment primary key,
    fname varchar(20),
    lname varchar(20),
    phone char(12),
    email varchar(45),
    address text,
    dob date,
    gender char(1) CHECK (gender IN ('M','F')),
    created_at datetime,
    updated_at timestamp default current_timestamp(),
    deleted_at datetime

);

CREATE TABLE emergency_contact (
    pid int,
    pid_contact int,
    relation varchar(20),
    CONSTRAINT fk_pid FOREIGN KEY (pid) REFERENCES people(id),
    CONSTRAINT fk_pid_contact FOREIGN KEY (pid_contact) REFERENCES people(id)
);

CREATE TABLE company_info (
    pid int, 
    title varchar(20),
    office varchar(20),
    CONSTRAINT fk_pid_info FOREIGN KEY (pid) REFERENCES people(id)
);

INSERT INTO people (fname, lname, phone, email, address, dob, gender, created_at)
    VALUES
    ('Daina',
     'Hughes', 
     '301-900-6543', 
    'Dainah@mgail.com',
    '4568 Greenvile Dr',
    '1993-20-02',
    'F',
    CURRENT_TIMESTAMP()
    );


INSERT INTO emergency_contact (pid, pid_contact, relation) 
    VALUES
    (1, 2, 'Sister'),
    (3, 4, 'Brother'),
    (5, 6, 'Cousins'),
    (7, 10, 'Sister'),
    (15, 16, 'Mother'),
    (8, 20, 'Aunt'),
    (17, 18, 'Uncle'),
    (21, 22, 'Friend'),
    (11, 12, 'Friend'),
    (13, 14, 'Uncle'),
    (19, 20, 'Friend'),
    (20, 21, 'Husband'),
    (9, 22, 'Wife');

INSERT INTO company_info (pid, title, office)
    VALUES
    (1, 'Ld Professional H.', 'Office Room 225'),
    (2, 'Sr. Accountant (WW)', 'Office Room 306'),
    (3, 'J. Accountant (EW)', 'Office Room 210'),
    (4, 'Ld. Janitor', 'Office Room 320'),
    (5, 'Ex. Manager (WW)', 'Office Room 315'),
    (6, 'Ex. Manager (EW)', 'Office Room 220'),
    (7, 'Jr. Professional H.', 'Office Room 200'),
    (8, 'Mail Carrier', 'Office Room 244'),
    (9, 'Security Officer', 'Office Room 110'),
    (10, 'Sr. Accountant (EW)', 'Office Room 205'),
    (11, 'Janitor', 'Office Room 318'),
    (12, 'Janitor', 'Office Room 325'),
    (13, 'Mail Carrier', 'Office Room 350'),
    (14, 'President', 'Office Room 250'),
    (15, 'Security Officer', 'Office Room 010'),
    (16, 'Security Officer', 'Office Room 400'),
    (17, 'Mail Carrier', 'Office Room 401'),
    (18, 'Supervisor (EW)', 'Office Room 150'),
    (19, 'Supervisor (WW)', 'Office Room 300'),
    (20, 'Sr. Accountant (C)', 'Office Room 275'),
    (21, 'Secretary', 'Office Room 265'),
    (22, 'Ld. Secretary', 'Office Room 250');


--Joining ex. (all this info goes into a joining table of its own)
--MAKE SURE ALL THE TABLES HAVE AT LEAST ONE SET OF INFO BEFORE DOING A JOIN!!
SELECT p.fname, p.lname,
--//the red text is variables, the white text is used to locate the tables to get the info from
--calling a certain first and last name from the people tab
    c.title as title,
--calling a certain title from the company info
    c.office as office,
--calling a certain office from the company info
    p2.fname as ec_fname,
--calling the first name of the person listed as an the emergency contact for --the specified employee (employee is from the people tab and is p (first --person), hence the p2 (first person from the emergency contact))
    p2.lname as ec_lname,
--follows the same format as p2.fname
    e.relation as ec_relation,
--calling the relationship of the emergency contact
    p2.phone as ec_phone
--calling the phone number of the emergency contact
    FROM people p 
--setted the p variable equal to the people table

--created 3 joins because we are connecting 3 tables
    JOIN company_info c ON p.id = pid
--first connection:
--setting the c variable equal to company_info table
----connecting an element (c) from the company info table to the people id slot at the pid for company info
----(Finds the matching id in the people id and the company_info pid and combines them)
    JOIN emergency_contact e ON c.pid = e.pid
--second connection:
--setting the e variable equal to the emergency_contact
----connecting an element (e) from the emergency_contact info to the company info element (c) pid at the pid for emergency contact pid
----(Finds the matching id for the emergency_contact pid and the company_info element's pid and combines them)
    JOIN people p2 ON e.pid_contact = p2.id
--third connection
--setting the p2 variable equal to people 
----connecting the element (e) pid_contact 
----(Finds the matching contact number of the emergency contact and the contactee's id and combines the on the people table)

--//TEST
-- SELECT p.fname, p.lname,
--     c.title as title,
--     c.office as office,
--     p2.fname as ec_fname,
--     p2.lname as ec_lname,
--     e.relation as ec_relation,
--     p2.phone as ec_phone
--     FROM people p 
--     JOIN company_info c ON p.id = pid
--     JOIN emergency_contact e ON c.pid = e.pid
--     JOIN people p2 ON e.pid_contact = p2.id;

--//TEST
--Year: yyyy/mm/dd
insert into people (fname, lname, phone, email, address, dob, gender, created_at)
    values
    ('Jack','West', '202-555-0127', 'JWest54@hayoo.com', '1234 FairwayBlues ST',  '1992-09-12', 'M', CURRENT_TIMESTAMP()),
    ('Dan','West', '202-555-0128', 'DWestLy89@hayoo.com', '4568 GreenLakes Ln', '1973-04-23', 'M', CURRENT_TIMESTAMP()),
    ('Samuel','Days', '202-555-0180', 'DaysofSam@loa.com', '7897 BrairStump Ave', '2000-05-22', 'M', CURRENT_TIMESTAMP()),
    ('Laura','Jones', '202-555-0149', 'JonLau@jajano.com', '012 BoardDyle Rd', '2000-05-22', 'F', CURRENT_TIMESTAMP()),
    ('Galligan','Hughes', '202-555-0148', 'GalligansMissions@jajano.com', '3485 VinePikes Ln', '1996-03-21', 'M', CURRENT_TIMESTAMP()),
    ('Francis','Daniels', '518-555-0161', 'DanielsFran@mgail.com', '302 Fairway Blvd', '1995-09-21', 'F', CURRENT_TIMESTAMP()),
    ('Quince','Pace', '518-555-0168', 'PaceQuince330@mgail.com', '835 Coffman Alley', '1979-05-17', 'M', CURRENT_TIMESTAMP()),
    ('Madeline','Moss', '518-555-0193', 'TheFirstMandM@mgail.com', '3998 Smithfield Avenue', '2001-06-12', 'F', CURRENT_TIMESTAMP()),
    ('Madeline','Syen', '518-555-0194', 'SwiMing40@mgail.com', '4144 Crowfield Road', '1999-01-12', 'F', CURRENT_TIMESTAMP()),
    ('Tonya','Harris', '617-555-0168', 'SwiMing40@mgail.com', '3047 Bicetown Road','1980-07-25', 'F', CURRENT_TIMESTAMP()),
    ('Jack','Days', '617-555-0144', 'JDays45@mgail.com', '4127 Pratt Avenue', '1999-08-08', 'M', CURRENT_TIMESTAMP()),
    ('Dan','Jones', '617-555-0107', 'DandyJoneses33@mjaloa.com', '2674 Owagner Lane', '1983-09-10', 'F', CURRENT_TIMESTAMP()),
    ('Samuel','West', '617-555-0146', 'WesternSam21@mjaloa.com', '3891 Woodland Drive', '1985-10-11', 'M', CURRENT_TIMESTAMP()),
    ('Laura','West', '603-555-0179', 'WesternLau30@loa.com', '3195 West Fork Street', '1989-11-12', 'F', CURRENT_TIMESTAMP()),
    ('Galligan','Pace', '603-555-0168', 'AGallsPace@hayoo.com', '242 Payne Street', '1990-05-12', 'M', CURRENT_TIMESTAMP()),
    ('Francis','Moss', '603-555-0112', 'MossyFran3@hayoo.com', '1739 Glen Street', '1995-04-30', 'M', CURRENT_TIMESTAMP()),
    ('Quince','Hughes', '501-555-0190', 'FancyQuinH3@hayoo.com', '3659 Bailey Drive', '1995-03-20', 'M', CURRENT_TIMESTAMP()),
    ('Madeline','Daniels', '501-555-0142', 'MadamMadeline@hayoo.com', '3963 Southern Street', '1997-04-12', 'F', CURRENT_TIMESTAMP()),
    ('Don','Harris', '605-555-0118', 'HarrisDon@jajano.com', '3374 Nelm Street', '1980-07-12', 'M', CURRENT_TIMESTAMP()),
    ('Tonya','Sven', '605-555-0103', 'SvenTo@loa.com', '2425 Park Avenue', '1976-05-08', 'F', CURRENT_TIMESTAMP());


insert into actors(fname, lname)
    values('Jack','Days'),
    ('Dan','Jones'),
    ('Samuel','West'),
    ('Laura','West'),
    ('Galligan','Pace'),
    ('Francis','Moss'),
    ('Quince','Hughes'),
    ('Madeline','Daniels'),
    ('Don','Harris'),
    ('Tonya','Sven');