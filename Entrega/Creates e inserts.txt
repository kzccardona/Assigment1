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