--PUNTO 2 
CREATE TABLESPACE UBER
DATAFILE 'UBERDF' SIZE 2G;

CREATE UNDO TABLESPACE UNDOUBER
DATAFILE 'UNDOUBERDF' SIZE 25M;

CREATE BIGFILE TABLESPACE BIGTSUBER
DATAFILE 'BIGUBERDF' SIZE 5G;

ALTER SYSTEM SET UNDO_TABLESPACE = UNDOUBER;

--PUNTO 3
CREATE USER YESICA
IDENTIFIED BY YESIKA
DEFAULT TABLESPACE UBER
QUOTA UNLIMITED ON UBER;

GRANT DBA TO YESICA
GRANT CONNECT TO YESICA

--PUNTO 4 CREAR 2 PERFILES
CREATE PROFILE CLERK LIMIT 
   SESSIONS_PER_USER          1
   IDLE_TIME                  10
   PASSWORD_LIFE_TIME         40
   FAILED_LOGIN_ATTEMPTS      4;

CREATE PROFILE development LIMIT 
   SESSIONS_PER_USER          2
   IDLE_TIME                  30
   PASSWORD_LIFE_TIME         100
   FAILED_LOGIN_ATTEMPTS      UNLIMITED;

--PUNTO 5 CREAR 4 USUARIOS
CREATE USER JOSE
IDENTIFIED BY JOSE
DEFAULT TABLESPACE UBER
QUOTA UNLIMITED ON UBER
PROFILE CLERK 

CREATE USER ANDRES
IDENTIFIED BY ANDRES
DEFAULT TABLESPACE UBER
QUOTA UNLIMITED ON UBER
PROFILE CLERK

CREATE USER KEVIN
IDENTIFIED BY KEVIN
DEFAULT TABLESPACE UBER
QUOTA UNLIMITED ON UBER
PROFILE development 

CREATE USER ALEJANDRO
IDENTIFIED BY ALEJANDRO
DEFAULT TABLESPACE UBER
QUOTA UNLIMITED ON UBER
PROFILE development 

GRANT CONNECT TO JOSE
GRANT CONNECT TO ANDRES
GRANT CONNECT TO KEVIN
GRANT CONNECT TO ALEJANDRO

ALTER USER ANDRES ACCOUNT LOCK
