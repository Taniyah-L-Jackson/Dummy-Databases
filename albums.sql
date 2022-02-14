CREATE DATABASE albums;

USE albums;

CREATE TABLE artists (
    artist_id int auto_increment PRIMARY KEY,
    artist varchar(45)
);

CREATE TABLE genres (
    id int auto_increment PRIMARY KEY,
    genre varchar(15)
);

CREATE TABLE labels (
    id int auto_increment PRIMARY KEY,
    label varchar(15)
);

CREATE TABLE awards (
    id int auto_increment PRIMARY KEY,
    type varchar(20),
    qty int
);

CREATE TABLE albums (
    
    id int auto_increment PRIMARY KEY,
    artist_id int,
    album_name varchar(30),
    genre_id int,
    label_id int,
    year SMALLINT,
    award_count int,
    units_sold int,
    platform varchar(20),
    CONSTRAINT fk_artist_id FOREIGN KEY (artist_id) REFERENCES artists(id),
    CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres(id),
    CONSTRAINT fk_label_id FOREIGN KEY (label_id) REFERENCES labels(id)
    
);

insert into genres(genre)
    VALUES
    ('Avant-Garde'),
    ('Blues'),
    ('Childrens'),
    ('Classical'),
    ('Spoken'),
    ('Country'),
    ('Easy Listening'),
    ('Electronic'),
    ('Folk'),
    ('International'),
    ('Jazz'),
    ('Latin'),
    ('R&B'),
    ('Reggae'),
    ('Stage & Screen'),
    ('Worship'),
    ('Vocal');

insert into artists(artist) 
    VALUES
    ('Alicia Keys'),
    ('Marvin Gaye'),
    ('Eiffel65'),
    ('Stevie Wonder'),
    ('Michael Jackson'),
    ('Bob Marley'),
    ('Nat King Cole'),
    ('Michael Buble'),
    ('Frank Sinata'),
    ('Pitbull'),
    ('Louis Armstrong'),
    ('Daft Punk'),
    ('Yo-Yo Ma'),
    ('Weird Al'),
    ('Tim McGraw');

insert into labels(label) 
    VALUES
    ('ARC'),
    ('BMG'),
    ('Columbia-CBS'),
    ('Decca'),
    ('EMI'),
    ('GPG'),
    ('HDD'),
    ('MCA'),
    ('PolyGram'),
    ('PPI'),
    ('RCA'),
    ('RCA/RAI'),
    ('Sony BMG'),
    ('Sony Music'), 
    ('UMG'),
    ('Warner Bros.'),
    ('Walmer Music'),
    ('WEA');

insert into awards(type) 
    VALUES
    ('Country'),
    ('American'),
    ('Billboard'),
    ('BRIT Awards'),
    ('CMT Awards'),
    ('CMA'),
    ('Eurovision'),
    ('Grammy'),
    ('MTV'),
    ('MCN Country'),
    ('Soul Train');

INSERT INTO albums(artist_id, album_name, genre_id, label_id, year, award_count, units_sold, platform)
    VALUES
    (4, 'Not_A_Real_Album', 9, 4, 1998, 300, '5.3M', 'Digital'),
    (4, 'Not A Real Album Sequel', 5, 4, 2004, 500, '7.8M', 'Digital'),
    (4, 'Blank Space', 9, 4, 1998, 300, '5.3M', 'Digital'),
    (4, 'Shooting Blanks', 9, 4, 1998, 300, '5.3M', 'Digital'),
    (4, 'Greevile', 9, 4, 1998, 300, '5.3M', 'Digital');


ALTER TABLE albums modify COLUMN year char(7);
ALTER TABLE albums modify COLUMN units_sold varchar(10);
