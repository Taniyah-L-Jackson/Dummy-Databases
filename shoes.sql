DROP DATABASE shoes; --if a database is there

CREATE DATABASE shoes; --create a new database called shoes

USE shoes; --access new database

--create tables with primary keys first

CREATE TABLE brands ( --side table with only primary keys
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE materials ( --side table with only primary keys
    id INT AUTO_INCREMENT PRIMARY KEY,
    material VARCHAR(20)
);

CREATE TABLE colors ( --side table with only primary keys
    id INT AUTO_INCREMENT PRIMARY KEY,
    color VARCHAR(20)
);

CREATE TABLE shoe_regions ( --side table with only primary keys
    id INT AUTO_INCREMENT PRIMARY KEY,
    placement VARCHAR(20)
);

CREATE TABLE shoes ( --main table with foreign keys
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    year SMALLINT,
    price DECIMAL,
    qty SMALLINT,
    `condition` VARCHAR(20),
    style VARCHAR(20),
    `type` VARCHAR(20),
    brand_id INT,
    CONSTRAINT fk_brand_id FOREIGN KEY (brand_id) REFERENCES brands(id)
);

CREATE TABLE shoe_material ( --side table with foreign keys
    shoe_id INT,
    material_id INT,
    CONSTRAINT fk_shoe_id FOREIGN KEY (shoe_id) REFERENCES shoes(id),
    CONSTRAINT fk_material_id FOREIGN KEY (material_id) REFERENCES materials(id)
);

CREATE TABLE shoe_region_color ( --side table with foreign keys
    shoe_id INT,
    color_id INT,
    shoe_region_id INT,
    CONSTRAINT fk_shoe_rc_id FOREIGN KEY (shoe_id) REFERENCES shoes(id),
    CONSTRAINT fk_color_id FOREIGN KEY (color_id) REFERENCES colors(id),
    CONSTRAINT fk_shoe_region_id FOREIGN KEY (shoe_region_id) REFERENCES shoe_regions(id)
);

--CONSTRAINT: cannot add to table if the other table being called is empty

INSERT INTO colors (color) 
    VALUES 
    ('White'),
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
    ('Olive');

INSERT INTO shoe_regions (placement)
    VALUES
    ('Insole'),
    ('Tongue'),
    ('Eyelet'),
    ('Throat Line'),
    ('Toe Cap'),
    ('Quarter'),
    ('Heel'),
    ('Vamp'),
    ('Outsole'),
    ('Welt');
    
INSERT INTO materials(material)
    VALUES
    ('Leather'),
    ('Canvas'),
    ('Nylon'),
    ('Satin'),
    ('Denim'),
    ('Textiles'),
    ('Synthetics'),
    ('Rubber'),
    ('Foam');

INSERT INTO brands(`name`)
    VALUES
    ('Nike'),
    ('Adidas'),
    ('Vans'),
    ('Puma'),
    ('Reebok'),
    ('Converse'),
    ('Under Armour'),
    ('DC'),
    ('New'),
    ('Balance'),
    ('Sketchers'),
    ('Etnies'),
    ('Asics'),
    ('Supra'),
    ('Champion'),
    ('Osiris'),
    ('Lebron'),
    ('Jordans'),
    ('Toms'),
    ('Tommy Hilfiger'),
    ('Derrick Rose'),
    ('Timerland'),
    ('Airwalk'),
    ('Lotto'),
    ('Sparx'),
    ('Crocs'),
    ('Uggs'),
    ('Levis'),
    ('Sperry'),
    ('Fallen'),
    ('Woodland'),
    ('Gucci'),
    ('High Sierra'),
    ('FUBU'),
    ('Lee'),
    ('Cooper'),
    ('Ecco'),
    ('Dr. Martens'),
    ('Merrell'),
    ('Lugz'),
    ('Roadster'),
    ('RedTape'),
    ('Lacoste'),
    ('Nunn'),
    ('Bush'),
    ('Saucony'),
    ('Hush Puppies'),
    ('American Eagle'),
    ('Bata'),
    ('KD'),
    ('Onitsuka Tiger'),
    ('Campus');

INSERT INTO shoe_material (shoe_id, material_id)
VALUES
(1, 1), 
(1, 6), 
(1, 3),
(2, 3), 
(2, 5), 
(2, 5),
(3, 2),
(3, 7),
(3, 6),
(4, 8),
(4, 9),
(4, 5),
(5, 3),
(5, 1),
(5, 2),
(6, 3),
(6, 1),
(6, 6),
(7, 4),
(7, 5),
(7, 8),
(8, 3),
(8, 3),
(8, 1),
(9, 2),
(9, 5),
(9, 4),
(10, 7),
(10, 6),
(10, 4);

INSERT INTO shoes(`name`, year, price, qty, `condition`, style, `type`, brand_id)
    VALUES
    ('Rainbow', 2010, 30.00, 7, 'New', 'low-cut', 'Boots', 4),
    ('Vines',  2010, 30.00, 7, 'Fair', 'high-top', 'Sneakers', 7),
    ('Lulus',  2010, 30.00, 7, 'Slightly New', 'low-top', 'Sneakers', 50),
    ('Jungle',  2010, 30.00, 7, 'New', 'high-cut', 'Lifestyle', 40),
    ('Hunters',  2010, 30.00, 7, 'Fair', 'low-cut', 'Casual', 30),
    ('Aqua',  2010, 30.00, 7, 'Slightly New', 'mid-cut', 'Formal', 20),
    ('Cloudy',  2010, 30.00, 7, 'New', 'low-cut', 'Business', 10),
    ('Forest Rain',  2010, 30.00, 7, 'Fair', 'high-top', 'Beach', 15),
    ('Saharas',  2010, 30.00, 7, 'Slighty New', 'high-cut', 'Night-Out', 25),
    ('Tundra',  2010, 30.00, 7, 'Fair', 'low-cut', 'Sports', 36);



INSERT INTO shoe_region_color(shoe_id, color_id, shoe_region_id)
    VALUES
    (1, 1, 1), 
    (1, 2, 2), 
    (1, 3, 3),
    (2, 4, 4), 
    (2, 5, 5), 
    (2, 6, 6),
    (3, 7, 7),
    (3, 8, 8),
    (3, 9, 9),
    (4, 10, 10),
    (4, 11, 1),
    (4, 12, 2),
    (5, 13, 3),
    (5, 14, 4),
    (5, 15, 5),
    (6, 16, 6),
    (6, 17, 7),
    (6, 18, 8),
    (7, 19, 9),
    (7, 20, 10),
    (7, 21, 1),
    (8, 22, 2),
    (8, 23, 3),
    (8, 24, 4),
    (9, 25, 5),
    (9, 26, 6),
    (9, 27, 7),
    (10, 28, 8),
    (10, 29, 9),
    (10, 30, 10);


--shoe region id: primary (10)
--color id: primary (30)
--shoe id: primary (10)

SELECT shoes.id, shoes.type, colors.id, shoe_regions.id
    FROM shoes, colors, shoe_regions
    
    JOIN shoes ON shoe_color_region.shoe_id
    --WARNING: CAUSES INFINITE LOOP IF ONLY A SELECT AND FROM IS USED

----------------------------------------------------------------------

--first step for show region color
INSERT INTO shoe_region_color(shoe_id)
    SELECT shoes.id FROM shoes;

SELECT s.id, s.type, c.id, sr.id, --call all the variables needed here
    FROM shoes s, colors c, shoe_regions sr, shoe_color_region scr --call all the tables being used along with the variables describing them here
    JOIN s
