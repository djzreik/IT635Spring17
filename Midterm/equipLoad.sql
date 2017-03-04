LOAD DATA LOCAL INFILE 'Equipment.csv' 
INTO TABLE Equipment  
    FIELDS TERMINATED BY ', ' 
           OPTIONALLY ENCLOSED BY '"'
    LINES  TERMINATED BY '\n' -- or \r\n
(Name, EquipmentID, Type, PrimaryStat, Slot);
