CREATE DATABASE cars; 
USE cars;

CREATE TABLE Make {

    Id int AUTO_INCREMENT primary key,
    Makes VARCHAR(20)

};

CREATE TABLE Color {

    Id int AUTO_INCREMENT primary key,
    Colors VARCHAR(20)

};

CREATE TABLE Type {

    Id int AUTO_INCREMENT primary key,
    Types VARCHAR(20)
    
};

CREATE TABLE cars (

    Id int auto_increment primary key,
    Model varchar(20),
    Year int(4),
    Fuel_Type varchar(10),
    City_MPG tinyint,
    Hwy_MPG tinyint,
    Type int,
    Price decimal(14,2),
    Vin char(17),
    Make int,
    Ex_Color int
    In_Color int,
    'Condition' varchar,
    CONSTRAINT fk_Make FOREIGN KEY (Make) REFERENCES makes(id);
    CONSTRAINT fk_Ex_Color FOREIGN KEY (Ex_Color) REFERENCES colors(id);
    CONSTRAINT fk_In_Color FOREIGN KEY (In_Color) REFERENCES colors(id);
    CONSTRAINT fk_Type FOREIGN KEY (Type) REFERENCES types(id);

);

--Remember that capitalization DOES matter

----------------------------------------------------------
-- Bryce's version

CREATE DATABASE cars;
USE cars;

CREATE TABLE makes(
    id int auto_increment primary key,
    make VARCHAR(20)
);

CREATE TABLE colors(
    id int auto_increment primary key,
    color VARCHAR(20)    
);

CREATE TABLE types(
    id int auto_increment primary key,
    type VARCHAR(20)    
);

CREATE TABLE cars(

    id int auto_increment primary key,
    model varchar(20),
    year int(4),
    fuel_type varchar(10),
    city_mpg tinyint,
    hwy_mpg tinyint,
    price decimal(14,2),
    vin char(17),
    `condition` varchar(10),
    make int,
    ex_color int,
    in_color int,
    type_id int,
    CONSTRAINT fk_make FOREIGN KEY (make) REFERENCES makes(id),
    CONSTRAINT fk_ex_color FOREIGN KEY (ex_color) REFERENCES colors(id),
    CONSTRAINT fk_in_color FOREIGN KEY (in_color) REFERENCES colors(id),
    CONSTRAINT fk_type_id FOREIGN KEY (type_id) REFERENCES types(id)
 
    -- Just a side note:  CONSTRAINT (fk_(column_name)) FOREIGN KEY ((column_name)) REFERENCES (outer_table_being_called(id)),
    
);

--cars
INSERT INTO makes (make) VALUES ('Acura'),
('Alfa Romeo'),
('Am General'),
('Aston Martin'),
('Audi'),
('Avanti Motors'),
('Bentley'),
('BMW'),
('Bugatti'),
('Buick'),
('Cadillac'),
('Chevrolet'),
('Chrysler'),
('Daewoo'),
('Daihatsu'),
('Dodge'),
('Eagle'),
('Ferrari'),
('FIAT'),
('Fisker'),
('Ford'),
('Genesis'),
('Geo'),
('GMC'),
('Honda'),
('Hummer'),
('Hyundai'),
('INFINITI'),
('International'),
('Isuzu'),
('Jaguar'),
('Jeep'),
('Karma'),
('Kia'),
('Koenigsegg'),
('Lamborghini'),
('Land Rover'),
('Lexus'),
('Lincoln'),
('Lotus'),
('Maserati'),
('Maybach'),
('Mazda'),
('McLaren'),
('Mercedes-Benz'),
('Mercury'),
('MINI'),
('Mitsubishi'),
('Morgan'),
('Nissan'),
('Oldsmobile'),
('Pagani'),
('Panoz'),
('Peugeot'),
('Plymouth'),
('Pontiac'),
('Porsche'),
('Qvale'),
('RAM'),
('Rolls-Royce'),
('Saab'),
('Saleen'),
('Saturn'),
('Scion'),
('smart'),
('Spyker'),
('Sterling'),
('Subaru'),
('Suzuki'),
('Tesla'),
('Toyota'),
('Volkswagen'),
('Volvo'),
('Yugo');

--colors
INSERT INTO colors (color) VALUES ('White'),
('Yellow'),
('Blue'),
('Red'),
('Green'),
('Black'),
('Brown'),
('Azure'),
('Ivory'),
('Teal'),
('Silver'),
('Purple'),
('Navy blue'),
('Pea green'),
('Gray'),
('Orange'),
('Maroon'),
('Charcoal'),
('Aquamarine'),
('Coral'),
('Fuchsia'),
('Wheat'),
('Lime'),
('Crimson'),
('Khaki'),
('Hot pink'),
('Magenta'),
('Olden'),
('Plum'),
('Olive'),
('Cyan');

--types 
INSERT INTO types(type) VALUES
('SUV'),
('Truck'),
('Crossover'),
('Sedan'),
('Coupe');

--inserting in cars table
INSERT INTO cars (
    model,
    year,
    price,
    vin,
    make,
    ex_color,
    in_color,
    type_id

) VALUES (
    'Pilot',
    2015,
    32567.00,
    '0N22ARMXBUM8WLVH6',
    25,
    1,
    2,
    3
), (
    'Accord',
    2015,
    34756.00,
    'IN6VRPWRG5OS6D08W',
    25,
    4,
    5,
    1    
), (
    'Civic',
    2015,
    28432.00,
    'EQO3L89W2ZSECJXJK',
    25,
    10,
    14,
    2    
), (
    'Honda',
    2017,
    34332.00,
    'JTEHF21A130141826',
    65,
    10,
    12,
    4    
);

insert into cars (
    model,
    year,
    fuel_type,
    city_mpg,
    hwy_mpg,
    price,
    vin,
    `condition`, --use backticks to add to a value that is also used as a keyword
    make,
    ex_color,
    in_color,
    type_id

)values (
    'Gladiator',
    2020,
    'hybrid',
    200,
    3000,
    3450.00,
    'KMHTC6ADXFU238749',
    'New',
    32,
    10,
    6,
    3
);

insert into cars (
    model,
    year,
    fuel_type,
    city_mpg,
    hwy_mpg,
    price,
    vin,
    `condition`, --use backticks to add to a value that is also used as a keyword
    make,
    ex_color,
    in_color,
    type_id

)values (
    'Civic',
    2020,
    'hybrid',
    200,
    3000,
    3450.00,
    'KMHTC6ADXFU238749',
    'New',
    32,
    10,
    6,
    3
);

SELECT c.model, c.year, c.price, c.vin, 
--calling the tables from the main database 'cars'
    m.make as make,
    --m.make is the return var
    t.type as type, 
    --t.type is the return var
    clr.color as ex_color, 
    --clr.color is the return var stored in the ex_color
    clrs.color as in_color 
    --clrs.color is the return var stored in the in_color
    --colors table is called twice to get two sets of colors
    FROM cars c 
    --'c' variable references cars database
    JOIN colors clr ON c.ex_color = clr.id 
    --call from the colors table the variable (clr)'s value and set it equal to the color id
    JOIN colors clrs ON c.in_color = clrs.id
    --call from the colors table the variable (clrs)'s value and set it equal to the color id
    JOIN makes m ON m.id = c.make
    --call from the makes table the variable (m)'s value and set it equal to the makes id
    JOIN types t ON t.id = c.type_id;
    --call from the types table the variable (t)'s value and set it equal to the type_id id
    WHERE clr.color = 'Black';

-------------------------------------------------------------

-- //added this Mar 18, 2019:
-- ALTER TABLE cars
--     -> ADD deleted_at TIMESTAMP NULL DEFAULT NULL;
-- //the above lines made a new column with a timestamp
--//its use is to maintain record of deleted car
--//Orphan data: something deleted from the database that has no more relation to the table (NEEDS TO BE PREVENTED)
-- //Adding a 'deleted_at' column helps with keeping data that may have been accidentally deleted

-- how to add info that has been deleted
-- UPDATE cars
    -- -> SET deleted_at = NOW() WHERE id = 7

--how to reverse the effect
-- UPDATE cars
    -- -> SET deleted_at = NULL WHERE id = 7