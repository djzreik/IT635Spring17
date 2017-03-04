LOAD DATA LOCAL INFILE 'Specs.csv' 
INTO TABLE Specs  
    FIELDS TERMINATED BY ', ' 
           OPTIONALLY ENCLOSED BY '"'
    LINES  TERMINATED BY '\n' -- or \r\n
(Name, SpecID, Type);
