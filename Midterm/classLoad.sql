LOAD DATA LOCAL INFILE 'Classes.csv' 
INTO TABLE Classes  
    FIELDS TERMINATED BY ', ' 
           OPTIONALLY ENCLOSED BY '"'
    LINES  TERMINATED BY '\n' -- or \r\n
(Name, ClassID);
