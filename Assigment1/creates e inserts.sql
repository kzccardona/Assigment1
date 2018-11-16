CREATE TABLE BILLS(
ID INT PRIMARY KEY,
IDACCOUNT INT,
IDDRIVER INT,
IDVEHICLE INT,
IDPAYMENTMETHOD INT,
IDCOUPON INT,
IDCOIN INT,
IDCITY INT,
VALUE DECIMAL(20,2),
DISCOUNTS DECIMAL(20,2),
IDOVERRUN DECIMAL(20,2),
NETVALUE DECIMAL(20,2),
STARTTIME TIMESTAMP,
ENDTIME TIMESTAMP
);


CREATE TABLE OVERRUNS(
ID INT PRIMARY KEY,
DESCRIPTION VARCHAR2(255),
VALUE DECIMAL(20,2)
);

CREATE TABLE BILLDETAILS(
ID INT PRIMARY KEY,
IDBILL INT,
IDTRAVEL INT,
ORIGIN VARCHAR2(255),
DESTINATION VARCHAR2(255),
MILES DECIMAL(20,2),
TIME VARCHAR2(255)
);

CREATE TABLE TRAVELS(
ID INT PRIMARY KEY,
IDBILLDETAILS INT,
IDDRIVERVEHICLE INT,
LATITUDE DECIMAL(40,2),
LONGITUDE DECIMAL(40,2),
TRAVELDATE TIMESTAMP
);

CREATE TABLE USERS(
ID INT PRIMARY KEY,
IDCOUNTRY INT,
NAME VARCHAR2(255),
LASTNAME VARCHAR2(255),
CELPHONE VARCHAR2(255),
EMAIL VARCHAR2(255),
EMAIL2 VARCHAR2(255),
PHOTO VARCHAR2(255)
);

CREATE TABLE BUSINESS(
ID INT PRIMARY KEY,
IDCOUNTRY INT,
NAME VARCHAR2(255),
CELPHONE VARCHAR2(255),
EMAIL VARCHAR2(255),
EMAIL2 VARCHAR2(255),
CONTACTNAME VARCHAR2(255)
);

CREATE TABLE COUNTRIES (
ID INT PRIMARY KEY,
IDCOIN INT,
NAME VARCHAR2(255),
IDENTIFIER VARCHAR2(255)
);

CREATE TABLE CITIES (
ID INT PRIMARY KEY,
IDCOUNTRY INT,
NAME VARCHAR2(255)
);

CREATE TABLE LIQUIDATIONTRIPS(
ID INT PRIMARY KEY,
IDDRIVER INT,
IDVEHICLE INT,
VALUE DECIMAL(20,2),
DISCOUNTS DECIMAL(20,2),
INCENTIVES DECIMAL(20,2),
NETVALUE DECIMAL(20,2),
TRIPDATE DATE
);

CREATE TABLE LIQUIDATIONTRIPDETAILS(
ID INT PRIMARY KEY,
IDLIQUIDATIONTRIP INT,
IDTRAVEL INT,
VALUE DECIMAL(20,2),
DISCOUNTS DECIMAL(20,2),
INCENTIVES DECIMAL(20,2),
NETVALUE DECIMAL(20,2)
);

CREATE TABLE PAYMENTS(
ID INT PRIMARY KEY,
IDOWNER INT,
IDBANKOWNER INT,
AMMOUNT DECIMAL(20,2),
DISCOUNTS DECIMAL(20,2),
INCENTIVES DECIMAL(20,2),
PAYDATE DATE
);

CREATE TABLE ANDROIDPAY(
ID INT PRIMARY KEY,
IDACCOUNT INT,
EMAIL VARCHAR2(255)
);

CREATE TABLE CREDITCARDS(
ID INT PRIMARY KEY,
IDACCOUNT INT,
IDCOUNTRIES INT,
CARDNUMBER VARCHAR2(255),
EXPIRE DATE,
CODECVV VARCHAR2(255),
ZIPCODE
);

CREATE TABLE DEBITCARDS(
ID INT PRIMARY KEY,
IDACCOUNT INT,
IDCOUNTRIES INT,
CARDNUMBER VARCHAR2(255),
EXPIRE DATE,
CODECVV VARCHAR2(255),
ZIPCODE
);

CREATE TABLE PAYPAL(
ID INT PRIMARY KEY,
IDACCOUNT INT
);

CREATE TABLE PAYMENTS_METHODS(
ID INT PRIMARY KEY,
IDACCOUNT INT,
IDANDROIDPAY INT,
IDCREDITCARDS INT,
IDDEBITCARDS INT,
IDPAYPAL INT
);

CREATE TABLE USER_COUPONS(
ID INT PRIMARY KEY,
IDCOUPON INT,
IDPROFILE INT
);

CREATE TABLE COUPONS(
ID INT PRIMARY KEY,
IDPROFILE INT,
CODE VARCHAR2(255)
);

CREATE TABLE LANGUAGES(
ID INT PRIMARY KEY,
NAME VARCHAR2(255)
);

CREATE TABLE VEHICLES
(
 id int PRIMARY KEY
,brand varchar2(255)
,model varchar2(255)
,year date
,type_of_vehicle_id int
,engine int
,owner_id int
,type_of_service_id int
,vehicle_plate varchar2(255)
);

CREATE TABLE OWNERS
(
 id int PRIMARY KEY
,name varchar2(255)
,last_name varchar2(255)
,identification varchar2(255)
,cell_number int
,email varchar2(255)
,language_id int
,country_id
);

CREATE TABLE DRIVERS
(
 id int PRIMARY KEY
,name varchar2(255)
,last_name varchar2(255)
,identification varchar2(255)
,cell_number varchar2(255)
,email varchar2(255)
,license varchar2(255)
,language_id int
,country_id int

CREATE TABLE TYPE_OF_VEHICLES
(
 id int PRIMARY KEY
,description varchar2(255)
);

CREATE TABLE TYPE_OF_SERVICES
(
 id int PRIMARY KEY
,description varchar2(255)
);

CREATE TABLE BANKS
(
 id int PRIMARY KEY
,code int
,Name varchar2(255)
);

CREATE TABLE BANK_OWNERS
(
 id int PRIMARY KEY
,owner_id INT
,bank_id INT
,number_account varchar2(255)
,type_of_account varchar2(255)
);

CREATE TABLE VEHICLES_DRIVERS
(
 id int PRIMARY KEY
,vehicle_id INT
,driver_id INT
,observations varchar2(255)
);

CREATE TABLE COINS
(
 id int PRIMARY KEY
,Name varchar2(255)
,abbreviation varchar2(255)
);


--- fks---- 
ALTER TABLE BILLS
ADD CONSTRAINT FKACCOUNT
   FOREIGN KEY (IDACCOUNT)
   REFERENCES USERS(ID);
   
ALTER TABLE BILLS
ADD CONSTRAINT FKDRIVER
   FOREIGN KEY (IDDRIVER )
   REFERENCES DRIVERS(ID);
   
ALTER TABLE BILLS
ADD CONSTRAINT FKVEHICLE
   FOREIGN KEY (IDVEHICLE)
   REFERENCES VEHICLES(ID);
   
ALTER TABLE BILLS
ADD CONSTRAINT FKIDPAYMENTMETHOD 
   FOREIGN KEY (IDPAYMENTMETHOD)
   REFERENCES PAYMENTMETHODS(ID);
   
ALTER TABLE BILLS
ADD CONSTRAINT FKIDCOUPON 
   FOREIGN KEY (IDCOUPON)
   REFERENCES COUPONS(ID);

ALTER TABLE BILLS
ADD CONSTRAINT FKIDCOIN 
   FOREIGN KEY (IDCOIN)
   REFERENCES COINS(ID);
   
ALTER TABLE BILLS
ADD CONSTRAINT FKIDCITY  
   FOREIGN KEY (IDCITY )
   REFERENCES CITIES(ID);

ALTER TABLE BILLDETAILS
ADD CONSTRAINT FKIDBILL 
   FOREIGN KEY (IDBILL)
   REFERENCES BILLS(ID);

ALTER TABLE BILLDETAILS
ADD CONSTRAINT FKIDTRAVEL
   FOREIGN KEY (IDTRAVEL)
   REFERENCES TRAVELS(ID);

ALTER TABLE TRAVELS
ADD CONSTRAINT FKIDBILLDETAIL
   FOREIGN KEY (IDBILLDETAIL)
   REFERENCES BILLDETAILS(ID);
   
ALTER TABLE TRAVELS
ADD CONSTRAINT FKIDDRIVERVEHICLE 
   FOREIGN KEY (IDDRIVERVEHICLE )
   REFERENCES DRIVERVEHICLE (ID);
   
ALTER TABLE USERS
ADD CONSTRAINT FKIDCOUNTRY  
   FOREIGN KEY (IDCOUNTRY)
   REFERENCES COUNTRIES(ID);
   
ALTER TABLE BUSINESS
ADD CONSTRAINT FKIDCOUNTRY  
   FOREIGN KEY (IDCOUNTRY)
   REFERENCES COUNTRIES(ID);
   
ALTER TABLE COUNTRIES
ADD CONSTRAINT FKIDCOIN 
   FOREIGN KEY (IDCOIN)
   REFERENCES COINS(ID);
   
ALTER TABLE CITIES 
ADD CONSTRAINT FKIDCOUNTRY 
   FOREIGN KEY (IDCOUNTRY)
   REFERENCES COUNTRIES(ID);
   
ALTER TABLE LIQUIDATIONTRIPS 
ADD CONSTRAINT FKIDDRIVER  
   FOREIGN KEY (IDDRIVER)
   REFERENCES DRIVERS(ID);
   
ALTER TABLE LIQUIDATIONTRIPS 
ADD CONSTRAINT FKIDVEHICLE
   FOREIGN KEY (IDVEHICLE)
   REFERENCES VEHICLES(ID);

ALTER TABLE LIQUIDATIONTRIPDETAILS 
ADD CONSTRAINT FKLIQUIDATIONTRIP
   FOREIGN KEY (IDLIQUIDATIONTRIP)
   REFERENCES LIQUIDATIONTRIPS(ID);
   
ALTER TABLE LIQUIDATIONTRIPDETAILS 
ADD CONSTRAINT FKIDTRAVEL 
   FOREIGN KEY (IDTRAVEL )
   REFERENCES TRAVELS(ID);


ALTER TABLE PAYMENTS 
ADD CONSTRAINT FKIDOWNER 
   FOREIGN KEY (IDOWNER)
   REFERENCES OWNERS(ID);  
   
ALTER TABLE PAYMENTS 
ADD CONSTRAINT FKIDBANKOWNER
   FOREIGN KEY (IDBANKOWNER)
   REFERENCES BANKOWNER(ID);
   
ALTER TABLE PAYMENTS 
ADD CONSTRAINT FKIDBANKOWNER
   FOREIGN KEY (IDBANKOWNER)
   REFERENCES BANKOWNER(ID);

ALTER TABLE ANDROIDPAY
ADD CONSTRAINT FKIDACCOUNT
   FOREIGN KEY (IDACCOUNT)
   REFERENCES USERS(ID); 

ALTER TABLE CREDITCARDS
ADD CONSTRAINT FKIDACCOUNT
   FOREIGN KEY (IDACCOUNT)
   REFERENCES USERS(ID);

ALTER TABLE CREDITCARDS
ADD CONSTRAINT FKIDCOUNTRIES 
   FOREIGN KEY (IDCOUNTRIES)
   REFERENCES USERS(ID);

ALTER TABLE DEBITCARDS
ADD CONSTRAINT FKIDACCOUNT
   FOREIGN KEY (IDACCOUNT)
   REFERENCES USERS(ID);

ALTER TABLE DEBITCARDS
ADD CONSTRAINT FKIDCOUNTRIES 
   FOREIGN KEY (IDCOUNTRIES)
   REFERENCES USERS(ID);

ALTER TABLE PAYPAL
ADD CONSTRAINT FKIDACCOUNT
   FOREIGN KEY (IDACCOUNT)
   REFERENCES USERS(ID);

ALTER TABLE PAYMENTS_METHODS
ADD CONSTRAINT FKIDACCOUNT
   FOREIGN KEY (IDACCOUNT)
   REFERENCES USERS(ID);

ALTER TABLE PAYMENTS_METHODS
ADD CONSTRAINT FKIDANDROIDPAY
   FOREIGN KEY (IDANDROIDPAY)
   REFERENCES ANDROIDPAY(ID);

ALTER TABLE PAYMENTS_METHODS
ADD CONSTRAINT FKIDCREDITCARDS
   FOREIGN KEY (IDCREDITCARDS)
   REFERENCES CREDITCARDS(ID);

ALTER TABLE PAYMENTS_METHODS
ADD CONSTRAINT FKIDDEBITCARDS
   FOREIGN KEY (IDDEBITCARDS)
   REFERENCES DEBITCARDS(ID);

ALTER TABLE PAYMENTS_METHODS
ADD CONSTRAINT FKIDPAYPAL
   FOREIGN KEY (IDPAYPAL)
   REFERENCES PAYPAL(ID);

ALTER TABLE USER_COUPONS
ADD CONSTRAINT FKIDCOUPON 
   FOREIGN KEY (IDCOUPON)
   REFERENCES COUPONS(ID);

ALTER TABLE USER_COUPONS
ADD CONSTRAINT FKIDPROFILE 
   FOREIGN KEY (IDPROFILE)
   REFERENCES USERS(ID);

ALTER TABLE VEHICLES
ADD CONSTRAINT FK_TYPE_OF_VEHICLE_ID
   FOREIGN KEY (type_of_vehicle_id)
   REFERENCES TYPE_OF_VEHICLES(id);

ALTER TABLE VEHICLES
ADD CONSTRAINT FK_OWNER_ID
   FOREIGN KEY (owner_id)
   REFERENCES TYPE_OF_CARS(id);

ALTER TABLE VEHICLES
ADD CONSTRAINT FK_TYPE_OF_SERVICE_ID
   FOREIGN KEY (type_of_service_id)
   REFERENCES TYPE_OF_SERVICES(id);

ALTER TABLE OWNERS
ADD CONSTRAINT FK_LANGUAGE_ID
   FOREIGN KEY (language_id)
   REFERENCES LANGUAGES(id);

ALTER TABLE OWNERS
ADD CONSTRAINT FK_COUNTRY_ID
   FOREIGN KEY (country_id)
   REFERENCES COUNTRIES(id);

ALTER TABLE DRIVERS
ADD CONSTRAINT FK_LANGUAGE_ID
   FOREIGN KEY (language_id)
   REFERENCES LANGUAGES(id);

ALTER TABLE DRIVERS
ADD CONSTRAINT FK_COUNTRY_ID
   FOREIGN KEY (country_id)
   REFERENCES COUNTRIES(id);

ALTER TABLE  BANK_OWNERS
ADD CONSTRAINT FK_OWNER_ID
   FOREIGN KEY (owner_id)
   REFERENCES OWNERS(id);


ALTER TABLE  BANK_OWNERS
ADD CONSTRAINT FK_BANK_ID
   FOREIGN KEY (bank_id)
   REFERENCES BANKS(id);

ALTER TABLE  VEHICLES_DRIVERS
ADD CONSTRAINT FK_VEHICLE_ID
   FOREIGN KEY (vehicle_id)
   REFERENCES VEHICLES(id);

ALTER TABLE  VEHICLES_DRIVERS
ADD CONSTRAINT FK_DRIVER_ID
   FOREIGN KEY (driver_id)
   REFERENCES DRIVERS(id);

--secuencias 
CREATE SEQUENCE BILLS_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE OVERRUNS_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE BILLDETAILS_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE TRAVELS_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE USERS_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE BUSINESS_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE COUNTRIES_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE CITIES_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE LIQUIDATIONTRIPS_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE LIQUIDATIONTRIPDETAILS_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE PAYMENTS_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE ANDROIDPAY_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;
CREATE SEQUENCE CREDITCARDS_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;
CREATE SEQUENCE DEBITCARDS_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;
CREATE SEQUENCE PAYPAL_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;
CREATE SEQUENCE PAYMENTS_METHODS_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;
CREATE SEQUENCE USER_COUPONS_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;
CREATE SEQUENCE COUPONS_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;
CREATE SEQUENCE LANGUAGES_SEQ
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE vehicles_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;


CREATE SEQUENCE owners_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE drivers_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;


CREATE SEQUENCE type_of_vehicles_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;


CREATE SEQUENCE type_of_services_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;


CREATE SEQUENCE banks_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;


CREATE SEQUENCE bank_owners_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;


CREATE SEQUENCE vehicle_drivers_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;

CREATE SEQUENCE coins_seq
  START WITH 1
  INCREMENT BY 1
  NOCYCLE;


--inserts 

insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Fijian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Macedonian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Persian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Telugu');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Ndebele');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Tok Pisin');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Bulgarian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'New Zealand Sign Language');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Oriya');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'New Zealand Sign Language');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Czech');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Macedonian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Romanian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'English');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Albanian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Marathi');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Sotho');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Gagauz');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Dzongkha');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Ndebele');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Montenegrin');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Oriya');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Guaran?');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Quechua');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Spanish');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'West Frisian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Icelandic');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Northern Sotho');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Persian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Icelandic');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Romanian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Bislama');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Mongolian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Azeri');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Mongolian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Fijian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Catalan');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Dari');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'New Zealand Sign Language');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Tok Pisin');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Georgian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'English');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Montenegrin');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Kurdish');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Papiamento');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Catalan');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Macedonian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Romanian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Kashmiri');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Hindi');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Danish');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Danish');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Amharic');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Georgian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Khmer');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Korean');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'New Zealand Sign Language');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Hiri Motu');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'German');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Guaran?');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'New Zealand Sign Language');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Latvian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Khmer');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Burmese');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Tswana');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Swedish');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Maltese');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Portuguese');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Japanese');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Norwegian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Norwegian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Albanian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Afrikaans');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'German');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Nepali');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Lithuanian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Portuguese');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'New Zealand Sign Language');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Czech');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Chinese');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Czech');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Kazakh');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Bislama');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Ndebele');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Czech');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Arabic');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Bislama');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Somali');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Bulgarian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Marathi');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Luxembourgish');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Ndebele');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Kazakh');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Estonian');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Yiddish');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Khmer');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Czech');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Chinese');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Filipino');
insert into LANGUAGES (ID, NAME) values (LANGUAGES_SEQ.NEXTVAL, 'Swahili');


-------------------------------------------

insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 68, 'China', '60760-167');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 43, 'Ukraine', '53746-119');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 5, 'Brazil', '43063-491');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 82, 'Ukraine', '53499-7272');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 26, 'Vietnam', '24208-539');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 24, 'Czech Republic', '55154-5152');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 50, 'Philippines', '44567-708');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 93, 'Indonesia', '63029-049');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 27, 'Peru', '13537-124');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 43, 'China', '10596-703');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 66, 'Indonesia', '50201-2400');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 22, 'Indonesia', '50436-6050');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 24, 'Portugal', '54868-6388');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 33, 'China', '36987-3066');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 55, 'Armenia', '55390-311');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 86, 'Indonesia', '41520-958');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 46, 'Bosnia and Herzegovina', '21749-527');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 51, 'Indonesia', '56062-468');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 9, 'Ghana', '64980-184');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 40, 'Canada', '59779-214');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 79, 'Portugal', '0363-2106');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 52, 'Ecuador', '60681-8001');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 10, 'Poland', '76214-003');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 71, 'Thailand', '11527-163');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 31, 'Thailand', '25021-111');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 42, 'China', '37808-734');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 5, 'Bangladesh', '16714-651');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 19, 'Poland', '65862-082');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 89, 'Indonesia', '11822-0304');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 77, 'Mongolia', '68084-414');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 66, 'Brazil', '76340-3001');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 15, 'China', '0078-0511');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 74, 'Sweden', '36987-1243');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 18, 'China', '0363-0099');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 87, 'Poland', '63629-2579');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 60, 'Brazil', '68462-110');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 70, 'Indonesia', '11489-068');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 46, 'Russia', '60505-0773');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 60, 'China', '0093-6301');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 29, 'China', '64380-716');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 89, 'Poland', '41520-002');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 55, 'Indonesia', '55319-608');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 31, 'Ecuador', '49483-333');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 68, 'Indonesia', '0781-1064');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 13, 'Indonesia', '0904-3379');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 50, 'Czech Republic', '35356-794');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 44, 'Poland', '55319-140');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 12, 'Thailand', '0456-1410');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 77, 'Peru', '49349-854');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 20, 'China', '0904-5463');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 94, 'China', '57520-0156');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 20, 'Russia', '68084-657');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 56, 'Portugal', '0591-3272');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 56, 'Peru', '64578-0102');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 79, 'Togo', '0338-0085');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 4, 'Chile', '0406-3312');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 12, 'Indonesia', '60505-2582');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 38, 'Chad', '63629-4642');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 29, 'China', '66116-393');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 34, 'Greece', '55910-141');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 24, 'Indonesia', '59667-0025');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 77, 'Iran', '0074-2277');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 87, 'Indonesia', '64193-423');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 72, 'Russia', '0093-2268');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 38, 'Mexico', '57664-437');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 68, 'Thailand', '51531-8363');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 23, 'Uganda', '54868-3435');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 93, 'Russia', '50268-699');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 80, 'China', '0009-0302');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 55, 'Philippines', '10157-9861');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 56, 'China', '24385-984');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 85, 'Ireland', '11822-0335');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 12, 'Norway', '42192-119');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 60, 'Nigeria', '62584-332');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 26, 'Uganda', '37012-326');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 81, 'Philippines', '0006-0275');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 83, 'China', '0378-0032');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 75, 'China', '76323-004');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 55, 'France', '36987-2969');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 78, 'Indonesia', '55651-012');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 7, 'Austria', '0268-6401');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 74, 'Philippines', '52936-170');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 31, 'Peru', '62175-442');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 94, 'Ireland', '68788-9032');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 1, 'China', '50988-272');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 44, 'Portugal', '51672-1279');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 92, 'Russia', '36800-422');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 20, 'Portugal', '55111-575');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 14, 'Bahrain', '28107-007');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 98, 'Russia', '10056-134');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 38, 'Indonesia', '0536-1019');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 85, 'Mozambique', '60505-2543');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 10, 'Indonesia', '10202-906');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 49, 'Gambia', '59779-242');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 37, 'China', '67457-433');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 97, 'South Korea', '68703-101');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 24, 'Zimbabwe', '0009-0271');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 63, 'Portugal', '68016-382');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 37, 'China', '57520-0495');
insert into COUNTRIES  (ID, IDCOIN , NAME , IDENTIFIER ) values (COUNTRIES_SEQ.NEXTVAL, 53, 'Philippines', '51079-452'

------------------------------------------

insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Philip', 'Ambrosio', '724-72-1388', '9162983943', 'pambrosio0@baidu.com', '496559051-1', 1, 1);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Angelica', 'Scannell', '266-95-4863', '7948156985', 'ascannell1@homestead.com', '954737100-2', 2, 2);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Jania', 'Couch', '578-13-2523', '9632090299', 'jcouch2@netlog.com', '491634911-3', 3, 3);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Bennie', 'Cripps', '262-54-7029', '6758147411', 'bcripps3@linkedin.com', '922117903-6', 4, 4);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Orson', 'Welland', '296-12-7819', '7948650738', 'owelland4@vistaprint.com', '786162961-9', 5, 5);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Lindy', 'Heinert', '884-32-0207', '3487712617', 'lheinert5@taobao.com', '318612684-3', 6, 6);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Halie', 'Gosart', '459-10-3974', '5586366785', 'hgosart6@last.fm', '711697642-6', 7, 7);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Clementine', 'Broadfield', '546-30-7192', '6293216169', 'cbroadfield7@dedecms.com', '944512279-8', 8, 8);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Torrin', 'Presho', '413-80-1619', '1468884089', 'tpresho8@rambler.ru', '202667619-4', 9, 9);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Ranee', 'Hamshaw', '768-63-5024', '3566571176', 'rhamshaw9@wix.com', '922794282-3', 10, 10);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Meridith', 'Pool', '520-46-8718', '3768973583', 'mpoola@fotki.com', '002183951-4', 11, 11);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Audrey', 'Demeter', '453-60-8010', '3778807726', 'ademeterb@exblog.jp', '012081302-5', 12, 12);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Oneida', 'Ure', '506-61-7611', '1356024637', 'ourec@homestead.com', '066047444-1', 13, 13);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Farris', 'Perez', '852-30-0365', '3787203910', 'fperezd@sbwire.com', '558205264-X', 14, 14);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Clementina', 'Tume', '516-49-4648', '3085953858', 'ctumee@zimbio.com', '455462366-1', 15, 15);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Thedrick', 'Ellse', '333-34-2002', '8679857103', 'tellsef@businesswire.com', '396090444-4', 16, 16);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Jephthah', 'Moorton', '278-65-1121', '9529190190', 'jmoortong@walmart.com', '840186369-4', 17, 17);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Ally', 'Conant', '832-38-0919', '3101826062', 'aconanth@ebay.com', '913033660-0', 18, 18);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Isidore', 'Coaker', '682-22-3826', '3476347335', 'icoakeri@i2i.jp', '099952704-5', 19, 19);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Sherye', 'Covolini', '503-20-9362', '5144573678', 'scovolinij@myspace.com', '488525082-X', 20, 20);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Cob', 'Rootham', '579-48-1734', '6084466211', 'croothamk@exblog.jp', '371465997-8', 21, 21);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Auguste', 'Edowes', '540-61-6720', '7252814542', 'aedowesl@constantcontact.com', '138353625-2', 22, 22);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Carolyn', 'Dunlap', '823-59-5933', '2695115724', 'cdunlapm@samsung.com', '043302403-8', 23, 23);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Ezra', 'Bowller', '531-33-1110', '5377519783', 'ebowllern@utexas.edu', '682124391-3', 24, 24);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Lane', 'Musprat', '710-84-8290', '4932889688', 'lmusprato@intel.com', '264002920-7', 25, 25);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Meridel', 'Richmont', '846-83-5034', '5203217345', 'mrichmontp@nationalgeographic.com', '284626947-5', 26, 26);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Susie', 'Shaddick', '730-99-0695', '4481621901', 'sshaddickq@wikia.com', '629121189-0', 27, 27);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Thibaud', 'Gehricke', '867-70-3481', '3098197580', 'tgehricker@intel.com', '872140224-8', 28, 28);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Joellen', 'George', '123-32-6372', '5181503027', 'jgeorges@phoca.cz', '244409402-6', 29, 29);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Domini', 'Garmanson', '234-85-2031', '3011020424', 'dgarmansont@shareasale.com', '772724807-X', 30, 30);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Vinita', 'McGilvra', '884-65-5251', '1633411943', 'vmcgilvrau@mayoclinic.com', '791489622-5', 31, 31);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Baillie', 'Minchinton', '132-25-1431', '4189716176', 'bminchintonv@woothemes.com', '219951931-7', 32, 32);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Clemmie', 'Kloser', '639-25-0797', '9527496755', 'ckloserw@netlog.com', '101237782-2', 33, 33);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Albie', 'Morison', '385-30-6692', '5517555685', 'amorisonx@imageshack.us', '531293862-9', 34, 34);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Jerrilyn', 'Bairstow', '635-81-3415', '5443386246', 'jbairstowy@lycos.com', '182400511-3', 35, 35);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Georgeanne', 'Lambarth', '237-94-3853', '2903224066', 'glambarthz@jiathis.com', '119533624-1', 36, 36);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Georgi', 'Gellert', '376-89-1723', '9742755259', 'ggellert10@marketwatch.com', '203936627-X', 37, 37);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Frannie', 'Griffin', '741-76-0767', '2345196986', 'fgriffin11@cafepress.com', '138510631-X', 38, 38);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Winfred', 'Treweke', '696-45-7164', '6732217447', 'wtreweke12@microsoft.com', '781022237-6', 39, 39);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Noni', 'Antrum', '372-36-8188', '3649800631', 'nantrum13@woothemes.com', '297706200-9', 40, 40);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Nolan', 'Leonards', '184-17-1024', '2647016306', 'nleonards14@va.gov', '404098203-7', 41, 41);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Brandy', 'Plomer', '120-07-1534', '4544340896', 'bplomer15@weebly.com', '209945629-1', 42, 42);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Annalee', 'Sowman', '432-16-7535', '2554786254', 'asowman16@acquirethisname.com', '571106967-5', 43, 43);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Odilia', 'Birkin', '144-14-9612', '4211704046', 'obirkin17@netlog.com', '005945278-1', 44, 44);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Amy', 'Lukianovich', '444-63-1230', '3847675487', 'alukianovich18@wsj.com', '360638824-1', 45, 45);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Meir', 'Bywater', '153-34-0813', '3359288744', 'mbywater19@samsung.com', '952906711-9', 46, 46);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Francklin', 'Gilbanks', '682-60-0410', '9971005982', 'fgilbanks1a@edublogs.org', '941220789-1', 47, 47);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Inna', 'Dormer', '812-50-0507', '8173279803', 'idormer1b@purevolume.com', '289937212-2', 48, 48);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Dallas', 'Novis', '706-43-2571', '6952454667', 'dnovis1c@blogs.com', '585436757-2', 49, 49);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Ramsey', 'Schiesterl', '139-70-0078', '2316323503', 'rschiesterl1d@nhs.uk', '272616956-2', 50, 50);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Issy', 'Atwater', '739-68-6271', '9951464042', 'iatwater1e@businessinsider.com', '274020101-X', 51, 51);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Larina', 'Westall', '680-86-4728', '2859388650', 'lwestall1f@yellowbook.com', '967402831-5', 52, 52);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Aloysius', 'Francke', '738-11-7015', '5957918357', 'afrancke1g@meetup.com', '302556968-9', 53, 53);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Barbara', 'Gyenes', '450-24-3919', '4357476627', 'bgyenes1h@ftc.gov', '030513373-X', 54, 54);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Dee dee', 'Larose', '109-81-5147', '9981567036', 'dlarose1i@booking.com', '961227466-5', 55, 55);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Karola', 'Jerschke', '856-29-3652', '4149647496', 'kjerschke1j@google.co.jp', '484821916-7', 56, 56);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Raddie', 'Basini-Gazzi', '655-36-5857', '2731267797', 'rbasinigazzi1k@indiatimes.com', '937338313-2', 57, 57);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Darsey', 'Pocklington', '487-60-4876', '5784691588', 'dpocklington1l@cbslocal.com', '348119426-9', 58, 58);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Celestia', 'Fendlow', '727-41-8940', '3355901650', 'cfendlow1m@usda.gov', '475646742-3', 59, 59);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Ibbie', 'Malling', '514-46-2716', '6856510432', 'imalling1n@twitpic.com', '586660949-5', 60, 60);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Merwyn', 'Shane', '608-60-3871', '7936919653', 'mshane1o@dot.gov', '864853453-4', 61, 61);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Elisha', 'Okenden', '256-24-0901', '6659208757', 'eokenden1p@tiny.cc', '811342163-7', 62, 62);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Perry', 'Eaden', '376-07-4573', '9651451116', 'peaden1q@bing.com', '594275998-7', 63, 63);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Dieter', 'Tibbotts', '127-18-0906', '3077499177', 'dtibbotts1r@qq.com', '506416400-9', 64, 64);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Hebert', 'Brea', '354-72-9995', '1399238392', 'hbrea1s@surveymonkey.com', '187193437-0', 65, 65);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Nolan', 'Yarnell', '479-36-3091', '1888428519', 'nyarnell1t@washingtonpost.com', '535686982-7', 66, 66);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Bendicty', 'Reynold', '159-25-3072', '8904213532', 'breynold1u@ft.com', '164095821-5', 67, 67);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Spike', 'Grisewood', '139-24-4464', '4618996290', 'sgrisewood1v@imageshack.us', '069994374-4', 68, 68);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Meier', 'Adelberg', '497-27-7723', '2032907266', 'madelberg1w@plala.or.jp', '088035057-1', 69, 69);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Bevon', 'Kivits', '601-26-2640', '4562670372', 'bkivits1x@unblog.fr', '569695349-2', 70, 70);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Sib', 'Ruegg', '821-13-2695', '9586539669', 'sruegg1y@nba.com', '414467952-7', 71, 71);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Fin', 'McDermot', '246-46-2144', '8287824476', 'fmcdermot1z@uiuc.edu', '036439700-4', 72, 72);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Sigismondo', 'Nucciotti', '391-03-9019', '4746815253', 'snucciotti20@xinhuanet.com', '482403899-5', 73, 73);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Marrilee', 'Supple', '597-95-0174', '3039815688', 'msupple21@weather.com', '839800336-7', 74, 74);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Merline', 'Tym', '649-43-6585', '4863662411', 'mtym22@tumblr.com', '825886082-8', 75, 75);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Gabbey', 'Donner', '724-17-6260', '9859412445', 'gdonner23@fda.gov', '958789124-4', 76, 76);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Eben', 'Serjeant', '478-75-5633', '6201367332', 'eserjeant24@ow.ly', '992302955-7', 77, 77);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Leilah', 'Churches', '682-77-7149', '5818343995', 'lchurches25@constantcontact.com', '507381114-3', 78, 78);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Starr', 'Shory', '586-49-1130', '2491916667', 'sshory26@china.com.cn', '585533169-5', 79, 79);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Oralee', 'Barus', '810-88-0855', '8055608906', 'obarus27@biblegateway.com', '882372136-9', 80, 80);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Kennan', 'Harg', '735-56-6263', '6993582977', 'kharg28@prlog.org', '874281777-3', 81, 81);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Hugibert', 'Budgeon', '648-51-8383', '1778711389', 'hbudgeon29@cbslocal.com', '272200899-8', 82, 82);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Rosanne', 'Alp', '498-24-6211', '8783246346', 'ralp2a@dagondesign.com', '070171958-3', 83, 83);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Lia', 'Lukock', '502-52-7937', '5599008926', 'llukock2b@go.com', '696515749-6', 84, 84);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Dianne', 'Piola', '128-97-3163', '5615712873', 'dpiola2c@constantcontact.com', '187503153-7', 85, 85);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Farrah', 'Martynikhin', '164-29-1134', '1713427023', 'fmartynikhin2d@taobao.com', '304803643-1', 86, 86);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Bell', 'Hurley', '779-60-7213', '9062967081', 'bhurley2e@webmd.com', '382704642-4', 87, 87);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Vassily', 'Bedome', '471-02-9193', '7736719007', 'vbedome2f@g.co', '673509836-6', 88, 88);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Raul', 'Boissier', '813-98-0993', '7331293190', 'rboissier2g@skyrock.com', '944671727-2', 89, 89);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Brandy', 'Joseff', '117-05-9610', '1696232997', 'bjoseff2h@theglobeandmail.com', '832074430-X', 90, 90);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Boonie', 'Tabart', '140-10-9465', '3296701776', 'btabart2i@patch.com', '326329936-0', 91, 91);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Edy', 'Baszniak', '440-83-4680', '4213612644', 'ebaszniak2j@virginia.edu', '168820133-5', 92, 92);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Christophorus', 'Callington', '620-69-4380', '9252328739', 'ccallington2k@cnbc.com', '522407705-2', 93, 93);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Giulietta', 'Biddulph', '746-80-0746', '8115177275', 'gbiddulph2l@usatoday.com', '923470346-4', 94, 94);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Micky', 'Corbyn', '483-60-3517', '1128439389', 'mcorbyn2m@ebay.com', '732937583-7', 95, 95);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Ola', 'Pevsner', '314-24-9522', '5484288643', 'opevsner2n@sohu.com', '267770350-5', 96, 96);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Pincus', 'Pott', '749-79-2790', '3488438661', 'ppott2o@mit.edu', '647231876-X', 97, 97);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Natala', 'Le Barr', '786-14-9755', '7258206304', 'nlebarr2p@hatena.ne.jp', '046883616-0', 98, 98);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Amity', 'Speck', '441-93-9944', '1295248044', 'aspeck2q@dedecms.com', '627117668-2', 99, 99);
insert into DRIVERS (id, name, last_name, identification, cell_number, email, license, language_id, country_id) values (drivers_seq.NEXTVAL, 'Ayn', 'McArthur', '822-30-0776', '4075618886', 'amcarthur2r@nhs.uk', '807302893-X', 100, 100);

----------------------------------------------

insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 15, 78, 'FAE Business School - Faculdade de Administra??o e Economia');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 79, 72, 'Instituto Superior Polit?cnico Gaya');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 94, 9, 'University of Prince Edward Island');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 29, 37, 'Foundation University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 67, 70, 'Sri Sant Gajanan Maharaj College of Engineering');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 7, 100, 'Belarussian State University of Transport');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 77, 94, 'Dongduk Women''s University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 45, 40, 'Tashkent State University of Oriental Studies ');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 47, 90, 'Hokkaigakuen University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 56, 52, 'Universidad de San Carlos de Guatemala');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 25, 10, 'FAST - National University of Computer and Emerging Sciences (NUCES)');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 9, 58, 'Universidad de San Jos?');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 90, 72, 'Northeastern State University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 81, 98, 'Jingdezhen China Institute');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 75, 5, 'Ecole Nationale Sup?rieure des Mines de Douai');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 35, 15, 'Universidad Francisco de Paula Santander');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 62, 29, 'City University of New York (CUNY) System');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 20, 48, 'Argosy University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 30, 30, 'Kiev Slavonic University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 81, 27, 'Nara Medical University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 93, 72, 'Universidad de Sucre');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 91, 71, 'Yerevan State University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 3, 22, 'Fachhochschule Pur');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 50, 21, 'Ecole Catholique d''Arts & Metiers');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 29, 15, 'International Institute for Higher Education');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 12, 74, 'Mars Hill College');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 76, 10, 'Ecole Nationale V?t?rinaire de Nantes');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 63, 95, 'Higashi Nippon International University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 95, 60, 'Ecole Normale Sup?rieure de Lyon');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 87, 40, 'North East University Bangladesh');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 85, 72, 'Kashan University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 84, 66, 'National Pedagogical University M. Dragomanov ');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 46, 41, 'Nihon Fukushi University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 32, 64, 'Holy Family College');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 7, 60, 'Universidade Regional do Cariri');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 40, 4, 'Higher School of University and Advanced Studies Pisa');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 80, 27, 'Corporaci?n Universitaria de Santander (UDES)');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 100, 13, 'Western International University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 34, 42, 'Engineering College of Copenhagen');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 73, 68, 'University of Presov');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 75, 62, 'Academy of Arts "George Enescu" Iasi');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 28, 58, 'Guru Ghasidas University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 83, 49, 'Fashion Institute of New York');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 93, 87, 'Glasgow Caledonian University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 9, 75, 'Physical Education Academy in Wroclaw');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 12, 88, 'Universit? Abdelmalek Essadi');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 9, 40, 'University of Liverpool');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 66, 58, 'Universidad Academia de Humanismo Cristiano');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 20, 17, 'Universidad Dr. Jose Matias Delgado');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 79, 21, 'Hansung University Seoul');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 93, 30, 'LSB College');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 95, 89, 'King''s College London, University of London');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 1, 28, 'Villanova University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 38, 91, 'University of Virginia');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 56, 12, 'Universidad Carlos III de Madrid');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 27, 29, 'University of Toledo');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 71, 69, 'Universidad Nacional Agraria La Molina');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 66, 27, 'Soongsil University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 13, 42, 'College of St. Scholastica');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 88, 28, 'Institute of Industrial Electronics Engineering');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 5, 70, 'American Conservatory Theater');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 45, 27, 'Universit? d''Orl?ans');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 91, 39, 'Kokand State Pedagogical Institute');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 78, 75, 'Yaroslavl International University of Business and New Technologies');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 64, 81, 'Lehigh Univervsity');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 12, 31, 'Bellin College of Nursing');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 67, 70, 'Buena Vista University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 14, 68, 'Osaka Dental University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 1, 87, 'Siberian State Medical University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 94, 80, 'University of Trnava');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 5, 39, 'Nizhny Novgorod State Academy of Medicine');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 38, 64, 'San Diego University for Integrative Studies');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 71, 73, 'Marywood University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 22, 66, 'College for Financial Planning');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 100, 23, 'Marian College of Fond Du Lac');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 30, 60, 'Privredna Akademija (Business Academy)');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 17, 16, 'Universidad Adventista de Bolivia');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 91, 47, 'Liaoning Technical University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 46, 49, 'Pacific International College');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 30, 31, 'Shanghai Maritime University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 15, 88, 'Triton College');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 27, 42, 'Union University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 88, 80, 'Institute Of Technology, Australia');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 62, 53, 'Kerman Graduate University of Technology');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 22, 41, 'University of North America');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 54, 13, 'Espam Formation University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 70, 69, 'Fundaci?n Universitaria de Boyac?');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 62, 100, 'Kingston College');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 8, 22, 'Ursuline College');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 80, 91, 'Universidad Metropolitana de Ciencias de la Educaci?n');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 74, 9, 'University of Insurance and Banking in Warsaw');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 42, 24, 'Wheelock College');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 18, 54, 'Islamic Azad University, Sanandaj');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 20, 8, 'Iona College');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 8, 44, 'Stefan University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 87, 93, 'University of Medicine Magway');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 93, 42, 'Masaryk University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 1, 91, 'Sukhothai Thammathirat Open University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 95, 86, 'Kansai Medical University');
insert into VEHICLES_DRIVERS (id, vehicle_id, driver_id, observations) values (type_of_vehicles_seq.NEXTVAL, 94, 48, 'Southwestern Baptist Theological Seminary');

insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 7, 'Clemmie Withull', 'Withull', '525-267-5922', 'cwithull0@exblog.jp', 'cwithull0@newyorker.com', 'http://dummyimage.com/113x146.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 46, 'Darrel Hucke', 'Hucke', '134-810-9181', 'dhucke1@amazon.com', 'dhucke1@princeton.edu', 'http://dummyimage.com/215x206.jpg/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 20, 'Derron Jaqueminet', 'Jaqueminet', '855-404-1118', 'djaqueminet2@indiegogo.com', 'djaqueminet2@tiny.cc', 'http://dummyimage.com/127x121.png/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 62, 'Jerrome Matton', 'Matton', '727-301-6129', 'jmatton3@rambler.ru', 'jmatton3@comsenz.com', 'http://dummyimage.com/174x185.png/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 13, 'Sloane Creasy', 'Creasy', '299-963-9648', 'screasy4@disqus.com', 'screasy4@hud.gov', 'http://dummyimage.com/166x207.bmp/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 34, 'Rachel Dymock', 'Dymock', '774-439-5323', 'rdymock5@google.pl', 'rdymock5@weather.com', 'http://dummyimage.com/232x217.bmp/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 38, 'Wilbur Treagus', 'Treagus', '206-247-4712', 'wtreagus6@storify.com', 'wtreagus6@tamu.edu', 'http://dummyimage.com/144x196.jpg/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 85, 'Devonne Duckit', 'Duckit', '463-176-9683', 'dduckit7@yellowpages.com', 'dduckit7@soundcloud.com', 'http://dummyimage.com/219x126.png/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 14, 'Deborah Childerley', 'Childerley', '793-415-0763', 'dchilderley8@cargocollective.com', 'dchilderley8@usda.gov', 'http://dummyimage.com/166x128.jpg/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 21, 'Nev Abeau', 'Abeau', '855-140-4654', 'nabeau9@sina.com.cn', 'nabeau9@ning.com', 'http://dummyimage.com/169x106.bmp/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 93, 'Emogene Potell', 'Potell', '155-854-2597', 'epotella@mayoclinic.com', 'epotella@github.com', 'http://dummyimage.com/100x156.bmp/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 45, 'Joshuah Gatward', 'Gatward', '663-299-3976', 'jgatwardb@1und1.de', 'jgatwardb@statcounter.com', 'http://dummyimage.com/131x231.jpg/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 57, 'Curcio Barme', 'Barme', '698-287-5477', 'cbarmec@princeton.edu', 'cbarmec@google.com.au', 'http://dummyimage.com/183x144.bmp/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 26, 'Jane Francie', 'Francie', '984-300-4184', 'jfrancied@state.gov', 'jfrancied@prnewswire.com', 'http://dummyimage.com/189x228.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 63, 'Marjie Duignan', 'Duignan', '111-159-2960', 'mduignane@booking.com', 'mduignane@cyberchimps.com', 'http://dummyimage.com/131x108.png/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 62, 'Siward Ketchen', 'Ketchen', '507-820-0344', 'sketchenf@yahoo.co.jp', 'sketchenf@altervista.org', 'http://dummyimage.com/150x127.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 77, 'Malinde Farnan', 'Farnan', '929-708-7291', 'mfarnang@sohu.com', 'mfarnang@purevolume.com', 'http://dummyimage.com/215x170.bmp/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 100, 'Denni Augie', 'Augie', '942-493-6150', 'daugieh@lycos.com', 'daugieh@ca.gov', 'http://dummyimage.com/221x176.png/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 60, 'Rakel Knock', 'Knock', '953-984-0170', 'rknocki@live.com', 'rknocki@dropbox.com', 'http://dummyimage.com/199x100.bmp/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 92, 'Ermentrude McDowell', 'McDowell', '211-633-0692', 'emcdowellj@tamu.edu', 'emcdowellj@odnoklassniki.ru', 'http://dummyimage.com/159x160.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 97, 'Willard Gyse', 'Gyse', '165-132-1122', 'wgysek@senate.gov', 'wgysek@tamu.edu', 'http://dummyimage.com/212x140.jpg/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 17, 'Dreddy Begley', 'Begley', '635-385-3885', 'dbegleyl@forbes.com', 'dbegleyl@springer.com', 'http://dummyimage.com/218x208.jpg/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 76, 'Duffy Locarno', 'Locarno', '897-238-8299', 'dlocarnom@wisc.edu', 'dlocarnom@jugem.jp', 'http://dummyimage.com/164x202.bmp/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 32, 'Kattie Sutherley', 'Sutherley', '201-929-6306', 'ksutherleyn@intel.com', 'ksutherleyn@craigslist.org', 'http://dummyimage.com/103x128.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 22, 'Chrystel Suddock', 'Suddock', '756-187-4734', 'csuddocko@acquirethisname.com', 'csuddocko@nbcnews.com', 'http://dummyimage.com/238x238.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 50, 'Adrien Levitt', 'Levitt', '619-263-2626', 'alevittp@t-online.de', 'alevittp@usda.gov', 'http://dummyimage.com/128x101.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 71, 'Loella Soulsby', 'Soulsby', '650-361-3246', 'lsoulsbyq@godaddy.com', 'lsoulsbyq@jalbum.net', 'http://dummyimage.com/146x117.png/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 51, 'Iver Cayette', 'Cayette', '592-199-6734', 'icayetter@japanpost.jp', 'icayetter@omniture.com', 'http://dummyimage.com/198x210.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 100, 'Worth Holt', 'Holt', '675-372-3852', 'wholts@japanpost.jp', 'wholts@netvibes.com', 'http://dummyimage.com/242x198.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 79, 'Alastair Callaway', 'Callaway', '866-677-9662', 'acallawayt@cargocollective.com', 'acallawayt@liveinternet.ru', 'http://dummyimage.com/138x132.jpg/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 41, 'Elijah Dumberrill', 'Dumberrill', '470-281-7929', 'edumberrillu@google.es', 'edumberrillu@gizmodo.com', 'http://dummyimage.com/103x196.jpg/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 44, 'Tana Muddle', 'Muddle', '192-706-7262', 'tmuddlev@cam.ac.uk', 'tmuddlev@yandex.ru', 'http://dummyimage.com/133x239.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 17, 'Lucila Penticoot', 'Penticoot', '179-761-7103', 'lpenticootw@earthlink.net', 'lpenticootw@businessweek.com', 'http://dummyimage.com/108x189.png/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 51, 'Munmro Brice', 'Brice', '787-898-8370', 'mbricex@wikipedia.org', 'mbricex@angelfire.com', 'http://dummyimage.com/246x141.bmp/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 61, 'Lamont West', 'West', '139-732-1822', 'lwesty@skype.com', 'lwesty@parallels.com', 'http://dummyimage.com/210x245.jpg/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 1, 'Cal Ludlow', 'Ludlow', '446-267-6339', 'cludlowz@cisco.com', 'cludlowz@nps.gov', 'http://dummyimage.com/204x125.jpg/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 36, 'Codie Pyford', 'Pyford', '135-334-1416', 'cpyford10@4shared.com', 'cpyford10@zdnet.com', 'http://dummyimage.com/201x128.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 6, 'Bird Hanfrey', 'Hanfrey', '400-442-8484', 'bhanfrey11@imageshack.us', 'bhanfrey11@desdev.cn', 'http://dummyimage.com/169x186.bmp/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 40, 'Laird Trehearn', 'Trehearn', '679-888-9534', 'ltrehearn12@msu.edu', 'ltrehearn12@aol.com', 'http://dummyimage.com/152x246.png/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 68, 'Blanch Binestead', 'Binestead', '331-675-0818', 'bbinestead13@tmall.com', 'bbinestead13@weibo.com', 'http://dummyimage.com/225x161.png/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 50, 'Brendan Feragh', 'Feragh', '150-472-5417', 'bferagh14@163.com', 'bferagh14@archive.org', 'http://dummyimage.com/138x245.png/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 71, 'Duke Aps', 'Aps', '808-318-2132', 'daps15@marketwatch.com', 'daps15@bloomberg.com', 'http://dummyimage.com/211x134.bmp/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 29, 'Birgitta Keelin', 'Keelin', '335-569-1997', 'bkeelin16@arstechnica.com', 'bkeelin16@abc.net.au', 'http://dummyimage.com/128x108.bmp/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 17, 'Annalise Renwick', 'Renwick', '855-621-2884', 'arenwick17@amazon.co.jp', 'arenwick17@sogou.com', 'http://dummyimage.com/247x166.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 88, 'Leah Brumham', 'Brumham', '680-291-9795', 'lbrumham18@oakley.com', 'lbrumham18@lycos.com', 'http://dummyimage.com/117x176.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 82, 'Creighton Larrett', 'Larrett', '709-602-4829', 'clarrett19@shinystat.com', 'clarrett19@adobe.com', 'http://dummyimage.com/108x222.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 88, 'Guido Hannigane', 'Hannigane', '888-703-7857', 'ghannigane1a@whitehouse.gov', 'ghannigane1a@youtube.com', 'http://dummyimage.com/190x173.png/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 99, 'Clari Kentwell', 'Kentwell', '251-980-3769', 'ckentwell1b@aboutads.info', 'ckentwell1b@usatoday.com', 'http://dummyimage.com/110x181.bmp/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 82, 'Kinnie McAmish', 'McAmish', '777-477-2286', 'kmcamish1c@domainmarket.com', 'kmcamish1c@lulu.com', 'http://dummyimage.com/208x224.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 22, 'Leann Driutti', 'Driutti', '760-946-3109', 'ldriutti1d@washingtonpost.com', 'ldriutti1d@psu.edu', 'http://dummyimage.com/180x108.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 41, 'Tiffy Davisson', 'Davisson', '413-152-9071', 'tdavisson1e@ustream.tv', 'tdavisson1e@eepurl.com', 'http://dummyimage.com/203x151.bmp/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 78, 'Carin Drinkhill', 'Drinkhill', '444-199-2141', 'cdrinkhill1f@geocities.com', 'cdrinkhill1f@senate.gov', 'http://dummyimage.com/232x234.png/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 49, 'Christy Matyashev', 'Matyashev', '806-440-4107', 'cmatyashev1g@w3.org', 'cmatyashev1g@jiathis.com', 'http://dummyimage.com/132x160.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 99, 'Godwin Juggins', 'Juggins', '538-480-9390', 'gjuggins1h@ca.gov', 'gjuggins1h@buzzfeed.com', 'http://dummyimage.com/162x206.bmp/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 39, 'Janna Evennett', 'Evennett', '822-879-8933', 'jevennett1i@dagondesign.com', 'jevennett1i@hhs.gov', 'http://dummyimage.com/127x182.png/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 28, 'Shaine Gemnett', 'Gemnett', '592-653-8628', 'sgemnett1j@gizmodo.com', 'sgemnett1j@topsy.com', 'http://dummyimage.com/185x226.bmp/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 10, 'Ross Hedworth', 'Hedworth', '402-227-5295', 'rhedworth1k@admin.ch', 'rhedworth1k@ftc.gov', 'http://dummyimage.com/186x190.jpg/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 90, 'Michal Fremantle', 'Fremantle', '808-157-6465', 'mfremantle1l@patch.com', 'mfremantle1l@qq.com', 'http://dummyimage.com/235x115.bmp/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 20, 'Sabine Hellmore', 'Hellmore', '230-411-2739', 'shellmore1m@1688.com', 'shellmore1m@goo.gl', 'http://dummyimage.com/112x188.png/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 2, 'Haslett Forlonge', 'Forlonge', '614-172-4816', 'hforlonge1n@tuttocitta.it', 'hforlonge1n@tinypic.com', 'http://dummyimage.com/132x196.png/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 29, 'Melisa Banville', 'Banville', '313-626-4022', 'mbanville1o@yolasite.com', 'mbanville1o@reference.com', 'http://dummyimage.com/137x243.bmp/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 13, 'Cob Cross', 'Cross', '666-731-7898', 'ccross1p@craigslist.org', 'ccross1p@weibo.com', 'http://dummyimage.com/237x110.png/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 2, 'Jefferson Tilberry', 'Tilberry', '517-241-6129', 'jtilberry1q@bizjournals.com', 'jtilberry1q@mail.ru', 'http://dummyimage.com/177x162.jpg/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 40, 'Randolph Zaniolini', 'Zaniolini', '679-942-5412', 'rzaniolini1r@state.tx.us', 'rzaniolini1r@bizjournals.com', 'http://dummyimage.com/127x239.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 38, 'Audre Baudinet', 'Baudinet', '467-604-2702', 'abaudinet1s@google.fr', 'abaudinet1s@newyorker.com', 'http://dummyimage.com/163x100.bmp/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 84, 'Leandra Rebichon', 'Rebichon', '555-492-7505', 'lrebichon1t@4shared.com', 'lrebichon1t@rambler.ru', 'http://dummyimage.com/239x105.jpg/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 81, 'Jeremiah Vanyukhin', 'Vanyukhin', '893-623-8381', 'jvanyukhin1u@etsy.com', 'jvanyukhin1u@princeton.edu', 'http://dummyimage.com/209x201.bmp/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 40, 'Vivie Spilstead', 'Spilstead', '918-385-3751', 'vspilstead1v@desdev.cn', 'vspilstead1v@hp.com', 'http://dummyimage.com/250x224.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 57, 'Renaldo Abramamovh', 'Abramamovh', '795-592-8363', 'rabramamovh1w@si.edu', 'rabramamovh1w@cafepress.com', 'http://dummyimage.com/112x187.bmp/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 93, 'Chrisse Steet', 'Steet', '471-126-9925', 'csteet1x@lycos.com', 'csteet1x@list-manage.com', 'http://dummyimage.com/109x132.bmp/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 97, 'Melonie Goucher', 'Goucher', '434-370-6955', 'mgoucher1y@google.pl', 'mgoucher1y@wix.com', 'http://dummyimage.com/100x120.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 83, 'Isis Thirlaway', 'Thirlaway', '224-949-9652', 'ithirlaway1z@oracle.com', 'ithirlaway1z@sphinn.com', 'http://dummyimage.com/145x111.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 9, 'Arv Piscopiello', 'Piscopiello', '268-665-1040', 'apiscopiello20@twitpic.com', 'apiscopiello20@ted.com', 'http://dummyimage.com/173x175.bmp/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 53, 'Ilsa Merck', 'Merck', '683-716-3309', 'imerck21@globo.com', 'imerck21@pen.io', 'http://dummyimage.com/125x147.jpg/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 38, 'Gan Renard', 'Renard', '390-270-6637', 'grenard22@hp.com', 'grenard22@weather.com', 'http://dummyimage.com/185x184.bmp/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 67, 'Elinor Redfearn', 'Redfearn', '851-493-5596', 'eredfearn23@microsoft.com', 'eredfearn23@seesaa.net', 'http://dummyimage.com/101x184.png/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 63, 'Carter Brogioni', 'Brogioni', '733-966-8949', 'cbrogioni24@bloomberg.com', 'cbrogioni24@foxnews.com', 'http://dummyimage.com/202x136.bmp/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 23, 'Daniele Ciccarelli', 'Ciccarelli', '220-118-5288', 'dciccarelli25@netlog.com', 'dciccarelli25@fema.gov', 'http://dummyimage.com/160x164.jpg/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 54, 'Clareta Doswell', 'Doswell', '103-945-1221', 'cdoswell26@fda.gov', 'cdoswell26@shareasale.com', 'http://dummyimage.com/203x205.bmp/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 79, 'Eldon O''Fergus', 'O''Fergus', '170-179-2945', 'eofergus27@newyorker.com', 'eofergus27@google.cn', 'http://dummyimage.com/219x102.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 31, 'Hilliary Gerrans', 'Gerrans', '698-225-8096', 'hgerrans28@yale.edu', 'hgerrans28@bravesites.com', 'http://dummyimage.com/230x179.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 10, 'Meggy Tassaker', 'Tassaker', '605-889-2281', 'mtassaker29@unicef.org', 'mtassaker29@free.fr', 'http://dummyimage.com/184x141.bmp/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 34, 'Sileas Louis', 'Louis', '794-996-5006', 'slouis2a@behance.net', 'slouis2a@samsung.com', 'http://dummyimage.com/146x205.bmp/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 1, 'Elsa Seward', 'Seward', '149-230-9536', 'eseward2b@ft.com', 'eseward2b@spiegel.de', 'http://dummyimage.com/104x103.jpg/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 8, 'Leonardo McLenahan', 'McLenahan', '898-668-8208', 'lmclenahan2c@goo.ne.jp', 'lmclenahan2c@bizjournals.com', 'http://dummyimage.com/199x247.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 36, 'Claudell Askell', 'Askell', '220-731-4751', 'caskell2d@drupal.org', 'caskell2d@multiply.com', 'http://dummyimage.com/112x188.jpg/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 48, 'Alexia Gelder', 'Gelder', '709-713-1861', 'agelder2e@bing.com', 'agelder2e@europa.eu', 'http://dummyimage.com/221x168.jpg/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 89, 'Dyana Wytchard', 'Wytchard', '751-778-7671', 'dwytchard2f@squidoo.com', 'dwytchard2f@ted.com', 'http://dummyimage.com/144x180.png/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 21, 'Ave Anfosso', 'Anfosso', '903-153-2205', 'aanfosso2g@angelfire.com', 'aanfosso2g@ebay.co.uk', 'http://dummyimage.com/138x227.jpg/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 66, 'Reba Jarrard', 'Jarrard', '786-396-2706', 'rjarrard2h@examiner.com', 'rjarrard2h@topsy.com', 'http://dummyimage.com/148x164.jpg/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 60, 'Ruthie Maleham', 'Maleham', '109-212-3283', 'rmaleham2i@fda.gov', 'rmaleham2i@ifeng.com', 'http://dummyimage.com/223x175.png/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 36, 'Cassandry Whitbread', 'Whitbread', '212-827-3540', 'cwhitbread2j@themeforest.net', 'cwhitbread2j@hexun.com', 'http://dummyimage.com/179x204.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 77, 'Abbe Gleeson', 'Gleeson', '446-215-3877', 'agleeson2k@moonfruit.com', 'agleeson2k@xing.com', 'http://dummyimage.com/238x147.jpg/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 76, 'Lalo Houlaghan', 'Houlaghan', '542-905-0495', 'lhoulaghan2l@marketwatch.com', 'lhoulaghan2l@sbwire.com', 'http://dummyimage.com/234x133.png/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 15, 'Dale Wolland', 'Wolland', '253-148-7005', 'dwolland2m@webs.com', 'dwolland2m@prlog.org', 'http://dummyimage.com/114x106.jpg/cc0000/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 81, 'Marisa Aspden', 'Aspden', '801-243-2484', 'maspden2n@homestead.com', 'maspden2n@apple.com', 'http://dummyimage.com/150x239.png/ff4444/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 45, 'Kit Reynish', 'Reynish', '229-466-8886', 'kreynish2o@psu.edu', 'kreynish2o@hud.gov', 'http://dummyimage.com/169x135.png/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 43, 'Wynny O''Halligan', 'O''Halligan', '961-226-6291', 'wohalligan2p@bing.com', 'wohalligan2p@twitpic.com', 'http://dummyimage.com/155x150.bmp/dddddd/000000');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 70, 'Jere Hame', 'Hame', '635-967-7418', 'jhame2q@netlog.com', 'jhame2q@bigcartel.com', 'http://dummyimage.com/158x134.jpg/5fa2dd/ffffff');
insert into USERS (id, IDCOUNTRY , NAME , LASTNAME , CELPHONE , EMAIL  , EMAIL2 , PHOTO ) values (USERS_SEQ.NEXTVAL, 75, 'Nicola McCumesky', 'McCumesky', '628-132-3133', 'nmccumesky2r@pinterest.com', 'nmccumesky2r@alexa.com', 'http://dummyimage.com/249x163.png/cc0000/ffffff');

insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 1, 91, '676773683953375578', '11/2/2017', 1, '54473-179');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 21, 26, '374622095503057', '2/02/2018', 2, '12258-241');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 60, 27, '3531159046521502', '1/05/2018', 3, '0942-6317');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 1, 75, '501883221036795251', '12/05/2017', 4, '47593-391');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 5, 47, '201817237244896', '6/03/2018', 5, '55910-006');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 68, 95, '4739381974008249', '4/02/2018', 6, '49999-540');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 46, 89, '5048376837622890', '4/01/2018', 7, '0002-4770');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 49, 79, '3559252064019868', '10/09/2017', 8, '0268-1455');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 10, 22, '3536886861642154', '11/03/2017', 9, '10768-7733');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 59, 61, '5020150905364806', '1/02/2018', 10, '68479-160');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 57, 20, '0604076486156789', '5/06/2018', 11, '49884-019');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 77, 72, '6387609521752913', '9/07/2018', 12, '0603-6241');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 15, 78, '3531119431625136', '4/05/2018', 13, '29300-131');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 44, 52, '30063595090244', '10/07/2017', 14, '55714-4512');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 47, 35, '4936510556687951', '5/04/2018', 15, '0185-0550');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 48, 19, '30001330994569', '4/03/2018', 16, '65044-5113');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 68, 15, '5100134315324587', '3/01/2018', 17, '49349-963');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 91, 61, '201421867849783', '11/07/2017', 18, '68151-1452');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 56, 83, '5293156691715044', '4/06/2018', 19, '36987-2097');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 35, 31, '30419128813330', '8/05/2018', 20, '0904-6069');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 100, 53, '3576023736038738', '2/05/2018', 21, '16571-012');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 85, 39, '3529276822248342', '4/06/2018', 22, '58503-062');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 5, 59, '560223920157687321', '2/07/2018', 23, '33261-542');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 45, 41, '344470722412020', '7/00/2018', 24, '0268-1521');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 22, 83, '4844324267660716', '1/08/2018', 25, '46123-033');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 46, 33, '67610204898719983', '4/8/2018', 26, '11344-603');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 17, 90, '343742342169474', '1/07/2018', 27, '36987-1840');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 29, 13, '4970425251600', '9/10/2018', 28, '68788-9807');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 60, 43, '5018002373577921386', '6/8/2018', 29, '35356-938');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 45, 87, '5602211363496500', '12/07/2017', 30, '57844-130');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 87, 51, '3576242261298612', '11/7/2017', 31, '0781-1048');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 23, 61, '4405791042134517', '7/07/2018', 32, '41250-441');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 2, 22, '5100138256030475', '1/08/2018', 33, '53077-4001');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 37, 61, '3533236907983746', '11/02/2017', 34, '61442-111');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 42, 1, '3555244189714378', '1/11/2018', 35, '52389-155');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 72, 20, '6759663913925603', '2/08/2018', 36, '0603-4082');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 63, 40, '4913901568438920', '8/05/2018', 37, '24488-024');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 38, 7, '3582735820621283', '9/07/2018', 38, '52567-124');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 53, 30, '6706228282282889', '6/04/2018', 39, '49999-095');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 83, 36, '3531209376170055', '7/08/2018', 40, '51672-1322');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 57, 21, '201808942921688', '10/04/2017', 41, '54868-4728');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 77, 17, '6373914357021433', '5/09/2018', 42, '13668-119');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 50, 84, '3574569977261845', '7/10/2018', 43, '28851-695');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 62, 2, '6709651134826979972', '12/03/2017', 44, '67457-217');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 71, 28, '3579544382797035', '3/02/2018', 45, '10544-534');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 49, 99, '3581986705045848', '7/02/2018', 46, '43319-010');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 59, 43, '373190065497446', '2/8/2018', 47, '0409-2987');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 88, 38, '5610675194245114', '8/09/2018', 48, '0944-4351');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 27, 25, '5602259884616346', '8/01/2018', 49, '0781-1976');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 48, 1, '3548227673693893', '10/7/2017', 50, '60512-6561');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 57, 33, '3575995509099768', '12/11/2017', 51, '62011-0222');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 60, 76, '3585469094853268', '5/8/2018', 52, '54569-5616');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 3, 11, '3561755247878360', '2/2/2018', 53, '62742-4057');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 65, 57, '4017958298648', '3/3/2018', 54, '60429-792');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 88, 77, '5007666430484345', '8/9/2018', 55, '0172-4960');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 90, 98, '3551283070316020', '3/7/2018', 56, '49288-0951');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 17, 5, '5038290961484817355', '12/3/2017', 57, '49527-999');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 73, 45, '4041590169553', '3/05/2018', 58, '0615-7584');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 20, 85, '30188532474399', '6/06/2018', 59, '0363-0742');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 37, 17, '5007665648555177', '5/5/2018', 60, '52584-119');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 60, 96, '30488743467764', '12/5/2017', 61, '63304-296');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 12, 35, '56101918179034437', '9/4/2018', 62, '16714-393');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 15, 17, '560225114991913659', '12/03/2017', 63, '50988-289');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 11, 82, '4917996284215277', '6/01/2018', 64, '54575-089');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 15, 43, '6763854459970673', '6/01/2018', 65, '0406-0362');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 13, 34, '5244624446498190', '7/01/2018', 66, '76168-021');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 16, 51, '5108753677246807', '5/8/2018', 67, '68327-026');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 73, 72, '30253295175284', '10/03/2017', 68, '10678-003');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 63, 34, '67065674757834836', '6/06/2018', 69, '68462-426');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 51, 4, '3580900046935352', '9/09/2018', 70, '10812-814');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 74, 3, '3558789499648259', '4/04/2018', 71, '43063-183');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 22, 57, '3575934004478896', '2/04/2018', 72, '0781-1750');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 85, 85, '633325819518207112', '1/06/2018', 73, '50436-6112');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 9, 45, '4026497909102733', '3/04/2018', 74, '49789-070');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 38, 67, '3558998873577196', '1/09/2018', 75, '11523-1702');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 18, 70, '3549360329711642', '9/4/2018', 76, '47682-810');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 43, 85, '5499191980694248', '4/10/2018', 77, '25021-117');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 73, 89, '4917718764881323', '5/7/2018', 78, '59538-002');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 99, 28, '3560471134038685', '5/9/2018', 79, '35356-759');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 36, 38, '5602213206961635756', '12/08/2017', 80, '49288-0277');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 65, 40, '56022284206067676', '10/06/2017', 81, '66828-0030');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 93, 83, '3580326869786344', '1/10/2018', 82, '62802-108');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 20, 28, '5100174011635712', '9/10/2018', 83, '42507-304');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 77, 6, '3549268204270107', '1/05/2018', 84, '24208-730');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 44, 20, '3578517518332027', '5/05/2018', 85, '21695-728');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 46, 26, '3540411619142565', '1/02/2018', 86, '0536-1850');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 61, 41, '374288636403510', '8/06/2018', 87, '0115-1234');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 59, 92, '4026686414487775', '9/6/2018', 88, '34690-5001');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 11, 65, '560224403380762103', '6/9/2018', 89, '12830-717');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 83, 86, '589325727800826917', '4/11/2018', 90, '36987-1634');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 88, 66, '201687346015374', '6/3/2018', 91, '10678-002');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 54, 66, '374622829329019', '4/02/2018', 92, '30805-008');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 32, 75, '201970242158401', '1/08/2018', 93, '0944-4201');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 88, 27, '589361577724391406', '10/5/2017', 94, '24090-497');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 54, 27, '3560632229422742', '4/06/2018', 95, '69097-148');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 8, 13, '67611477482124989', '4/09/2018', 96, '21695-636');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 77, 3, '5458015450460377', '11/07/2017', 97, '55111-399');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 19, 80, '4026392921859909', '12/05/2017', 98, '0496-0778');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 26, 81, '5010124989333344', '11/07/2017', 99, '59726-257');
insert into CREDITCARDS (ID, IDACCOUNT, IDCOUNTRIES , CARDNUMBER , EXPIRE , CODECVV , ZIPCODE) values (CREDITCARDS_SEQ.NEXTVAL, 50, 17, '201735310417272', '2/4/2018', 100, '76461-915');

insert into TRAVELS (ID , IDBILLDETAILS , IDDRIVERVEHICLE , LATITUDE  , LONGITUDE , TRAVELDATE ) values (TRAVELS_SEQ.NEXTVAL, 1, 93, '45.41675', '-71.6324', '9/02/2018');
insert into TRAVELS (ID , IDBILLDETAILS , IDDRIVERVEHICLE , LATITUDE  , LONGITUDE , TRAVELDATE ) values (TRAVELS_SEQ.NEXTVAL, 1, 75, 53.3004898, -6.2634596, '12/5/2017');
insert into TRAVELS (ID , IDBILLDETAILS , IDDRIVERVEHICLE , LATITUDE  , LONGITUDE , TRAVELDATE ) values (TRAVELS_SEQ.NEXTVAL, 1, 70, 41.8012304, 43.4814896, '3/12/2018');
insert into TRAVELS (ID , IDBILLDETAILS , IDDRIVERVEHICLE , LATITUDE  , LONGITUDE , TRAVELDATE ) values (TRAVELS_SEQ.NEXTVAL, 1, 44, 46.1016128, 47.7243761, '3/03/2018');
insert into TRAVELS (ID , IDBILLDETAILS , IDDRIVERVEHICLE , LATITUDE  , LONGITUDE , TRAVELDATE ) values (TRAVELS_SEQ.NEXTVAL, 1, 58, -4.3822378, 38.0605006, '5/10/2018');
insert into TRAVELS (ID , IDBILLDETAILS , IDDRIVERVEHICLE , LATITUDE  , LONGITUDE , TRAVELDATE ) values (TRAVELS_SEQ.NEXTVAL, 1, 29, -6.9277361, 106.9299579, '12/10/2017');
insert into TRAVELS (ID , IDBILLDETAILS , IDDRIVERVEHICLE , LATITUDE  , LONGITUDE , TRAVELDATE ) values (TRAVELS_SEQ.NEXTVAL, 1, 8, -22.7428673, -45.5963557, '4/07/2018');
insert into TRAVELS (ID , IDBILLDETAILS , IDDRIVERVEHICLE , LATITUDE  , LONGITUDE , TRAVELDATE ) values (TRAVELS_SEQ.NEXTVAL, 1, 68, 26.433417, 110.856622, '10/08/2017');
insert into TRAVELS (ID , IDBILLDETAILS , IDDRIVERVEHICLE , LATITUDE  , LONGITUDE , TRAVELDATE ) values (TRAVELS_SEQ.NEXTVAL, 1, 59, 48.7786908, -123.7079417, '7/09/2018');
insert into TRAVELS (ID , IDBILLDETAILS , IDDRIVERVEHICLE , LATITUDE  , LONGITUDE , TRAVELDATE ) values (TRAVELS_SEQ.NEXTVAL, 1, 1, -7.4212735, 107.172085, '10/09/2017');

insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 15, 7, 25648, 43373, 18797, '8/10/2018');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 12, 18, 28295, 47771, 49082, '11/12/2017');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 6, 1, 38737, 38722, 3249, '10/12/2017');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 7, 1, 31891, 10715, 25618, '8/11/2018');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 17, 10, 31106, 48905, 40512, '5/05/2018');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 11, 1, 10465, 16478, 38157, '1/1/2018');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 10, 18, 33458, 43219, 23192, '10/12/2017');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 14, 15, 42023, 46204, 25079, '11/08/2017');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 14, 10, 24288, 32715, 17250, '5/06/2018');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 3, 2, 38731, 28153, 38544, '6/4/2018');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 15, 7, 25648, 43373, 18797, '8/06/2018');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 12, 18, 28295, 47771, 49082, '11/03/2017');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 6, 1, 38737, 38722, 3249, '10/12/2017');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 7, 1, 31891, 10715, 25618, '8/11/2018');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 17, 10, 31106, 48905, 40512, '5/11/2018');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 11, 1, 10465, 16478, 38157, '1/1/2018');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 10, 18, 33458, 43219, 23192, '10/12/2017');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 14, 15, 42023, 46204, 25079, '11/06/2017');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 14, 10, 24288, 32715, 17250, '5/01/2018');
insert into PAYMENTS (ID , IDOWNER , IDBANKOWNER , AMMOUNT , DISCOUNTS , INCENTIVES , PAYDATE ) values (PAYMENTS_SEQ.NEXTVAL, 3, 2, 38731, 28153, 38544, '6/4/2018');