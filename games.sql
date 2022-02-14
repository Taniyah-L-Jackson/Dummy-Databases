DROP DATABASE game_list;

CREATE DATABASE game_list;

USE game_list;

CREATE TABLE Designers (
    id int AUTO_INCREMENT PRIMARY KEY,
    designer varchar(20)
);

CREATE TABLE Game_systems (
    id int AUTO_INCREMENT PRIMARY KEY,
    game_system varchar(35)
);

CREATE TABLE Games (
    id int AUTO_INCREMENT PRIMARY KEY,
    Title varchar(45),
    Rating varchar(4),
    System_Used int,
    Designer int,
    Multiplatform char(3),
    Year_Released int(4),
    Copies_Sold varchar(10),
    Total_Revenue decimal(20,2),   
    CONSTRAINT fk_System_Used FOREIGN KEY (System_Used) REFERENCES Game_systems(id),
    CONSTRAINT fk_Designer FOREIGN KEY (Designer) REFERENCES Designers(id)
);

INSERT INTO Games (
    Title, 
    Rating, 
    Multiplatform, 
    Year_Released, 
    Copies_Sold, 
    Total_Revenue

) VALUES (
    
       
    
    
