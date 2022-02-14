//Movie database in MySql

CREATE TABLE actors (
    id int auto_increment primary key,
    fname varchar(20),
    lname varchar(20)
);

CREATE TABLE directors (
    id int auto_increment primary key,
    fname varchar(20),
    lname varchar(20)
);

CREATE TABLE genres (
    id int auto_increment primary key,
    genre varchar(20)
);

//Optional Syntax (added datatypes)

CREATE TABLE `genres` (
    `id` int auto_increment primary key,
    genre varchar(20)
);

//-------------------------------------

CREATE TABLE movies (
    id int auto_increment primary key,
    title varchar(45),
    year tinyint(4), //changed to int(4)
    director_id int NOT NULL,
    genre_id int NOT NULL,
    format varchar(20),
    rating varchar(10),
    budget int,
    CONSTRAINT fk_director_id FOREIGN KEY (director_id)
        REFERENCES directors (id),
    CONSTRAINT fk_genre_id FOREIGN KEY (genre_id)
        REFERENCES genres (id)
);

CREATE TABLE movie_actor (
    movie_id int,
    actor_id int,
    PRIMARY KEY (movie_id, actor_id)
);

MariaDB [movie_db]> select m.title from movies m 
    -- //get movie.title from movies table column movies
    -- -> join movie_actor ma on ma.movie_id = m.id
    -- //connect movie_actor table to movie_actor_id table where id = movie_id
    -- -> join actors a on ma.actor_id = a.id
    -- //connect actors table to movie_actor_id table where id = actor_id
    -- -> where a.id=3;
    -- //grab from where actor.id = 3;


select genre from genres g
    join movies m on m.genre_id = g.id
    join movie_actor ma on ma.movie_id = m.id
    join actors a on a.id = ma.actor_id
    where a.id=1;

insert into directors(fname, lname)
    values('Jack','West'),
    ('Dan','West'),
    ('Samuel','Days'),
    ('Laura','Jones'),
    ('Galligan','Hughes'),
    ('Francis','Daniels'),
    ('Quince','Pace'),
    ('Madeline','Moss'),
    ('Madeline','Syen'),
    ('Tonya','Harris');

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

insert into movies(title, director_id, genre_id)
    values
    ('Kingsman', 3, 1),
    ('Ajin', 4, 1),
    ('Strong Woman Bong Soon', 9, 2),
    ('All Quiet On The Western Front', 6, 3);

//-----------------------------------------------


