--Creaciòn de tablas
CREATE TABLE TIPOS_DE_PAGO (
ID INT PRIMARY KEY
,NOMBRE VARCHAR2(255)
);

CREATE TABLE MEDIOS_DE_PAGO (
ID INT PRIMARY KEY
,ID_CLIENTE INT
,ID_TIPO_PAGO INT
,DATOS VARCHAR2(255)
);



CREATE TABLE CLIENTES (
ID INT PRIMARY KEY
,ID_PAIS INT
,IDENTIFICACION VARCHAR2(255)
,NOMBRE VARCHAR2(255)
,APELLIDOS VARCHAR2(255)
,CELULAR VARCHAR2(255)
,EMAIL VARCHAR2(255)
,EMAIL2 VARCHAR2(255)
,EMPRESA VARCHAR2(255)
,NOMBRE_EMPRESA VARCHAR2(255)
);

-- Foreign Key
ALTER TABLE CLIENTES
ADD CONSTRAINT FK_ID_PAIS
   FOREIGN KEY (ID_PAIS)
   REFERENCES COUNTRIES(ID);
   
ALTER TABLE MEDIOS_DE_PAGO
ADD CONSTRAINT FK_ID_CLIENTE
   FOREIGN KEY (ID_CLIENTE)
   REFERENCES CLIENTES(ID);
 
ALTER TABLE MEDIOS_DE_PAGO
ADD CONSTRAINT FK_ID_TIPO_PAGO
   FOREIGN KEY (ID_TIPO_PAGO)
   REFERENCES TIPOS_DE_PAGO(ID);  

-- Secuencias
CREATE SEQUENCE CLIENTES_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE MEDIOS_DE_PAGO_SEQ
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE TIPOS_DE_PAGO_SEQ
START WITH 1
INCREMENT BY 1;


--INSERTS CLIENTES
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (1, 1, '5465239034', 'Bethany', 'Benjafield', '8848879993', 'mbenjafield0@prlog.org', 'mbenjafield0@reverbnation.com', 'FALSO', 'Browsezoom');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (2, 1, '3226238124', 'Devlin', 'Mayberry', '4955913164', 'dmayberry1@gmpg.org', 'dmayberry1@paginegialle.it', 'VERDADERO', 'Npath');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (3, 1, '9843245660', 'Golda', 'Perico', '0140284028', 'aperico2@artisteer.com', 'aperico2@mozilla.com', 'VERDADERO', 'BANCOLOMBIA');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (4, 1, '6314226503', 'Ephrem', 'Fairley', '3812305879', 'ofairley3@alexa.com', 'ofairley3@fastcompany.com', 'FALSO', 'Realbuzz');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (5, 1, '9640363006', 'Ambros', 'Leftbridge', '5407332604', 'ileftbridge4@pinterest.com', 'ileftbridge4@unicef.org', 'VERDADERO', 'Ooba');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (6, 1, '3348088070', 'Shanna', 'Collington', '4923336277', 'gcollington5@posterous.com', 'gcollington5@fastcompany.com', 'FALSO', 'Tambee');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (7, 2, '3105246053', 'Georas', 'McGlone', '1954484801', 'vmcglone6@cdc.gov', 'vmcglone6@trellian.com', 'VERDADERO', 'Jabbersphere');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (8, 2, '0111551633', 'Dianemarie', 'Seller', '2651347779', 'sseller7@chicagotribune.com', 'sseller7@upenn.edu', 'FALSO', 'Buzzshare');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (9, 2, '9617617161', 'Lurlene', 'Jentin', '3229505751', 'jjentin8@mlb.com', 'jjentin8@huffingtonpost.com', 'FALSO', 'Wikido');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (10, 2, '0072062797', 'Crin', 'Beever', '3006413717', 'jbeever9@oaic.gov.au', 'jbeever9@jimdo.com', 'FALSO', 'Photobean');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (11, 2, '0367945339', 'Thornie', 'Yarrington', '4255138680', 'fyarringtona@imdb.com', 'fyarringtona@statcounter.com', 'FALSO', 'Quinu');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (12, 2, '3927931012', 'Boris', 'Crowley', '7212641820', 'ecrowleyb@cargocollective.com', 'ecrowleyb@netscape.com', 'FALSO', 'Eare');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (13, 3, '3664303237', 'Saree', 'Krop', '9877117444', 'rkropc@dropbox.com', 'rkropc@who.int', 'FALSO', 'Tazz');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (14, 3, '2262864098', 'Lyn', 'Lewty', '5348294977', 'olewtyd@altervista.org', 'olewtyd@globo.com', 'FALSO', 'Talane');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (15, 3, '3733755103', 'Alair', 'Walisiak', '6348670929', 'owalisiake@yellowbook.com', 'owalisiake@google.com.br', 'FALSO', 'Thoughtstorm');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (16, 3, '7636006162', 'Ardine', 'McGaughay', '5789057594', 'lmcgaughayf@over-blog.com', 'lmcgaughayf@weebly.com', 'FALSO', 'Gigabox');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (17, 3, '7747914636', 'Leanor', 'Hentzeler', '0084344903', 'whentzelerg@time.com', 'whentzelerg@imageshack.us', 'FALSO', 'Oyondu');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (18, 3, '0681661526', 'Brockie', 'Grewar', '3942130483', 'lgrewarh@creativecommons.org', 'lgrewarh@weebly.com', 'FALSO', 'Rhybox');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (19, 4, '4531312848', 'Drucy', 'Margram', '1989133878', 'umargrami@icio.us', 'umargrami@nps.gov', 'FALSO', 'Rhynoodle');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (20, 4, '4461870502', 'Gaultiero', 'Kenway', '2159498629', 'ekenwayj@linkedin.com', 'ekenwayj@redcross.org', 'FALSO', 'Aivee');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (21, 4, '2233804120', 'Reade', 'Muriel', '4436470318', 'tmurielk@yahoo.co.jp', 'tmurielk@tiny.cc', 'FALSO', 'Wikibox');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (22, 4, '1838145958', 'Benoit', 'Northill', '9330753558', 'enorthilll@hubpages.com', 'enorthilll@printfriendly.com', 'VERDADERO', 'Brainsphere');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (23, 4, '5829527030', 'Katerina', 'Parkins', '3260239111', 'rparkinsm@bigcartel.com', 'rparkinsm@mysql.com', 'VERDADERO', 'Meejo');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (24, 4, '7377425709', 'Gaby', 'Slyman', '1091939446', 'bslymann@mayoclinic.com', 'bslymann@seesaa.net', 'VERDADERO', 'Skinix');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (25, 5, '5965260180', 'Olav', 'McGookin', '0001593595', 'rmcgookino@ustream.tv', 'rmcgookino@noaa.gov', 'VERDADERO', 'Mybuzz');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (26, 5, '6181071709', 'Willetta', 'McCart', '6133955015', 'imccartp@nymag.com', 'imccartp@github.io', 'VERDADERO', 'Quaxo');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (27, 5, '8973087622', 'Bordie', 'Longridge', '6731445169', 'dlongridgeq@harvard.edu', 'dlongridgeq@arstechnica.com', 'VERDADERO', 'Rhynyx');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (28, 5, '2159640832', 'Vivianne', 'Forsyde', '8441744351', 'gforsyder@youtube.com', 'gforsyder@dedecms.com', 'VERDADERO', 'Edgeblab');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (29, 5, '2486014314', 'Myrtia', 'Phibb', '3662037726', 'aphibbs@cnbc.com', 'aphibbs@ehow.com', 'VERDADERO', 'Wikizz');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (30, 5, '0222169664', 'Riane', 'Danson', '3087711896', 'fdansont@cocolog-nifty.com', 'fdansont@icio.us', 'VERDADERO', 'Thoughtstorm');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (31, 6, '0261522930', 'Georgeta', 'Heinritz', '4162256411', 'rheinritzu@themeforest.net', 'rheinritzu@4shared.com', 'VERDADERO', 'Wordpedia');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (32, 6, '6728321837', 'Marris', 'Dwelly', '6624300116', 'adwellyv@google.ca', 'adwellyv@google.com.au', 'VERDADERO', 'Jatri');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (33, 6, '1421558106', 'Thorpe', 'Ackrill', '6390740417', 'aackrillw@blogger.com', 'aackrillw@php.net', 'VERDADERO', 'Gabvine');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (34, 6, '9027743959', 'Elene', 'Howchin', '0991003357', 'ihowchinx@intel.com', 'ihowchinx@sfgate.com', 'VERDADERO', 'Centizu');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (35, 6, '3044640040', 'Terri-jo', 'Bartholomaus', '1130312151', 'gbartholomausy@apple.com', 'gbartholomausy@oakley.com', 'VERDADERO', 'Edgepulse');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (36, 6, '0573175047', 'Sena', 'Cristou', '5705080719', 'vcristouz@mashable.com', 'vcristouz@npr.org', 'VERDADERO', 'Skivee');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (37, 7, '4173339267', 'Tod', 'Gilder', '4130870440', 'ggilder10@freewebs.com', 'ggilder10@reddit.com', 'VERDADERO', 'Fiveclub');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (38, 7, '7258922601', 'Sterne', 'Lacrouts', '0396939872', 'clacrouts11@bloglovin.com', 'clacrouts11@senate.gov', 'VERDADERO', 'Bluezoom');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (39, 7, '6967645404', 'Saunder', 'Gloyens', '4108540697', 'agloyens12@hatena.ne.jp', 'agloyens12@cbc.ca', 'VERDADERO', 'Katz');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (40, 7, '5601388806', 'Micky', 'Brodley', '9475038663', 'fbrodley13@springer.com', 'fbrodley13@stanford.edu', 'VERDADERO', 'Zoomzone');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (41, 7, '9833977480', 'Tybi', 'Cuel', '2783085593', 'rcuel14@icio.us', 'rcuel14@de.vu', 'VERDADERO', 'Thoughtbeat');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (42, 7, '9450797846', 'Riannon', 'Titchmarsh', '1489293787', 'ctitchmarsh15@wordpress.org', 'ctitchmarsh15@etsy.com', 'VERDADERO', 'Plambee');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (43, 8, '6174292770', 'Mill', 'Lote', '3576704442', 'clote16@sohu.com', 'clote16@princeton.edu', 'VERDADERO', 'Eamia');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (44, 8, '1439970459', 'Aliza', 'Ferrier', '2788828578', 'pferrier17@soundcloud.com', 'pferrier17@home.pl', 'VERDADERO', 'Lajo');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (45, 8, '6183172278', 'Catie', 'Kirwan', '8381293669', 'skirwan18@csmonitor.com', 'skirwan18@sogou.com', 'FALSO', 'Voolith');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (46, 8, '4167667878', 'Ophelia', 'Klimpke', '0406201498', 'dklimpke19@bandcamp.com', 'dklimpke19@jigsy.com', 'FALSO', 'Skibox');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (47, 8, '2637058730', 'Boot', 'Abazi', '3521140326', 'labazi1a@hostgator.com', 'labazi1a@pcworld.com', 'FALSO', 'Divape');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (48, 8, '7993595959', 'Currie', 'Riccetti', '1290895864', 'griccetti1b@ted.com', 'griccetti1b@stumbleupon.com', 'FALSO', 'Fivechat');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (49, 9, '6790816453', 'Hurleigh', 'Leivesley', '0847986462', 'lleivesley1c@home.pl', 'lleivesley1c@wordpress.com', 'VERDADERO', 'Flashdog');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (50, 9, '0993612202', 'Sherwood', 'Ainsby', '2467069095', 'gainsby1d@youtu.be', 'gainsby1d@ning.com', 'FALSO', 'Bluejam');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (51, 9, '1670672379', 'Daisey', 'Killiam', '7532770656', 'bkilliam1e@goodreads.com', 'bkilliam1e@zdnet.com', 'VERDADERO', 'Eimbee');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (52, 9, '8105649004', 'Adriano', 'Yokley', '6007017370', 'jyokley1f@hhs.gov', 'jyokley1f@google.fr', 'FALSO', 'Aibox');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (53, 9, '9649126651', 'Maure', 'Goodred', '7422571004', 'agoodred1g@comcast.net', 'agoodred1g@last.fm', 'FALSO', 'Gevee');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (54, 9, '5752243386', 'Debra', 'Scrivener', '2126331350', 'nscrivener1h@home.pl', 'nscrivener1h@dyndns.org', 'FALSO', 'Photolist');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (55, 10, '0916680002', 'Ronnie', 'Beldan', '7603335515', 'obeldan1i@livejournal.com', 'obeldan1i@nih.gov', 'VERDADERO', 'Twimm');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (56, 10, '7113730264', 'Benny', 'Corran', '2963420269', 'scorran1j@sciencedirect.com', 'scorran1j@independent.co.uk', 'VERDADERO', 'Centidel');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (57, 10, '8986310376', 'Boy', 'Pawlata', '1993608036', 'ppawlata1k@accuweather.com', 'ppawlata1k@vinaora.com', 'FALSO', 'Gabtype');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (58, 10, '6946527658', 'Janice', 'Peare', '0190512105', 'vpeare1l@ibm.com', 'vpeare1l@zimbio.com', 'FALSO', 'Wikivu');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (59, 10, '2640303228', 'Samara', 'Jeavons', '4538185205', 'djeavons1m@issuu.com', 'djeavons1m@ask.com', 'FALSO', 'Thoughtsphere');
insert into CLIENTES (ID, ID_PAIS, IDENTIFICACION , NOMBRE , APELLIDOS, CELULAR, EMAIL, EMAIL2, EMPRESA, NOMBRE_EMPRESA) values (60, 10, '4587200921', 'Leia', 'Waldocke', '4441396139', 'swaldocke1n@goo.ne.jp', 'swaldocke1n@google.com', 'FALSO', 'Skajo');


--MEDIOS_DE_PAGO
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (1, 1, 1, '1596341, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (2, 1, 1, '9631451, Paypal');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (3, 2, 1, 'Efectivo');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (4, 2, 1, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (5, 3, 1, '985632, PaypalC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (6, 3, 1, '98745632, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (7, 4, 1, '8975214, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (8, 4, 1, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (9, 5, 1, '125478, Paypal');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (10, 5, 1, 'Efectivo');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (11, 6, 1, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (12, 6, 1, 'Efectivo');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (13, 7, 2, '684952, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (14, 7, 2, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (15, 8, 2, '023658, Paypal');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (16, 8, 2, '365478, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (17, 9, 2, '1547895, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (18, 9, 2, '258036, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (19, 10, 2, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (20, 10, 2, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (21, 11, 2, '524174789, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (22, 11, 2, 'Efectivo');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (23, 12, 2, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (24, 12, 2, '5897413, Paypal');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (25, 13, 3, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (26, 13, 3, '1458723, Paypal');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (27, 14, 3, 'Efectivo');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (28, 14, 3, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (29, 15, 3, '21645612, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (30, 15, 3, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (31, 16, 3, '2145451, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (32, 16, 3, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (33, 17, 3, '46973520, Paypal');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (34, 17, 3, '41543548, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (35, 18, 3, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (36, 18, 3, 'Efectivo');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (37, 19, 4, '8742216, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (38, 19, 4, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (39, 20, 4, '435431454, Paypal');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (40, 20, 4, 'Efectivo');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (41, 21, 4, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values(42, 21, 4, '3214542, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (43, 22, 4, 'Efectivo');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (44, 22, 4, '5265584, Paypal');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (45, 23, 4, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (46, 23, 4, '2547896, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (47, 24, 4, '515645636, Paypal');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (48, 24, 4, '5896341, TDC');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (49, 25, 1, '1247892, ANDROID');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (50, 25, 1, 'Efectivo');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (51, 26, 1, '7465454, Paypal');
insert into MEDIOS_DE_PAGO (ID, ID_CLIENTE , ID_TIPO_PAGO ,DATOS ) values (52, 26, 1, '5896341, TDC');



--TIPOS_DE_PAGO
insert into TIPOS_DE_PAGO (ID, NOMBRE) values (1, 'TDC');
insert into TIPOS_DE_PAGO (ID, NOMBRE) values (2, 'Android');
insert into TIPOS_DE_PAGO (ID, NOMBRE) values (3, 'Paypal');
insert into TIPOS_DE_PAGO (ID, NOMBRE) values (4, 'Efectivo');



 