
CREATE DATABASE  IF NOT EXISTS chat_system ;
USE chat_system;

CREATE TABLE userreg (
  firstname varchar(50) NOT NULL,
  lastname varchar(50) NOT NULL,
  gender varchar(20) NOT NULL,
  phoneno varchar(12) NOT NULL,
  emailid varchar(50) NOT NULL,
  password varchar(15) NOT NULL,
  secure_question varchar(50) NOT NULL,
  answer varchar(45) NOT NULL,
  status varchar(15) NOT NULL,
  images varchar(500) NOT NULL,
  PRIMARY KEY (phoneno)
);


CREATE TABLE systemchat (
  chatid int NOT NULL AUTO_INCREMENT,
  fromuser varchar(15) NOT NULL,
  touser varchar(15) NOT NULL,
  message varchar(500) NOT NULL,
  chat_date varchar(50) NOT NULL,
  PRIMARY KEY (chatid)
);


CREATE TABLE contactus (
  firstname varchar(50) NOT NULL,
  lastname varchar(50) NOT NULL,
  phoneno varchar(12) NOT NULL,
  emailid varchar(50) NOT NULL,
  message longtext
);