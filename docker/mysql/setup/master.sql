-- create the users for each database
-- CREATE USER 'projectoneuser'@'%' IDENTIFIED BY 'somepassword';
-- GRANT CREATE, ALTER, INDEX, LOCK TABLES, REFERENCES, UPDATE, DELETE, DROP, SELECT, INSERT ON `testdb`.* TO 'root'@'%';
-- GRANT replication slave ON "testdb".* TO "maindb"@"testdb" IDENTIFIED BY "password";
--
-- FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS example (
 id INT AUTO_INCREMENT PRIMARY KEY,
 text TEXT,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 )  ENGINE=INNODB;


CREATE USER slave_user@'%' IDENTIFIED WITH mysql_native_password BY 'slave_pass';
GRANT CREATE, ALTER, INDEX, LOCK TABLES, REFERENCES, UPDATE, DELETE, DROP, SELECT, INSERT ON `testdb`.* TO 'slave_user'@'%';
-- GRANT REPLICATION SLAVE ON *.* TO master@'%';
--GRANT replication slave ON "testdb".* TO "master_user"@"testdb" IDENTIFIED BY "password";
--GRANT REPLICATION SLAVE on testdb.* TO 'master_user'@'%';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'slave_user'@'%';
--GRANT REPLICATION SLAVE ON *.* TO 'slave_user'@'%';
--GRANT CREATE, ALTER, INDEX, LOCK TABLES, REFERENCES, UPDATE, DELETE, DROP, SELECT, INSERT ON `testdb`.* TO 'master_user'@'%';
FLUSH PRIVILEGES;