set hive.mapred.mode=nonstrict;
DROP TABLE IF EXISTS DECIMAL_4_1;
DROP TABLE IF EXISTS DECIMAL_4_2;

CREATE TABLE DECIMAL_4_1(key decimal(35,25), value int) 
ROW FORMAT DELIMITED
   FIELDS TERMINATED BY ' '
STORED AS TEXTFILE;

CREATE TABLE DECIMAL_4_2(key decimal(35,25), value decimal(35,25)) 
STORED AS ORC;

LOAD DATA LOCAL INPATH '../../data/files/kv7.txt' INTO TABLE DECIMAL_4_1;

INSERT OVERWRITE TABLE DECIMAL_4_2 SELECT key, key * 3 FROM DECIMAL_4_1;

SELECT * FROM DECIMAL_4_1 ORDER BY key, value;

SELECT * FROM DECIMAL_4_2 ORDER BY key;

DROP TABLE DECIMAL_4_1;
DROP TABLE DECIMAL_4_2;