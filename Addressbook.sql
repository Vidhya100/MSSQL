/* UC1 */
create database AddressBookService;
use AddressBookService;

/* UC2 */
create table AddressBook
(
firstName Varchar(255),
lastName varchar(255),
address varchar(255),
city char(255),
state char(255),
zip INT,
phoneNumber BIGINT,
email NVARCHAR(255)
);
SELECT * FROM AddressBook;

/* UC3 */
INSERT INTO AddressBook VALUES('Vidhya','Darade', 'Aashirvad Niwas', 'Jalna','Maharashtra',431205,1234567815,'vidhyadarade47@gmail.com');
INSERT INTO AddressBook VALUES('Ganesh','Mundhe', 'Aashirvad Niwas', 'Jalna','Maharashtra',512436,7894561235,'ganeshmundhe456@gmail.com');
INSERT INTO AddressBook VALUES('Vishal','Darade', 'Sarswati complex', 'vadodra','Gujrat',857691,4561237895,'vishaldarade54@gmail.com');
INSERT INTO AddressBook VALUES('Vidhya','Darade', 'Aashirvad Niwas', 'Benguluru','Karnatka',512346,7891234568,'vaibhavdarade158@gmail.com');

SELECT * FROM AddressBook;

/* UC4 */
--Update AddressBook SET address = 'Matoshri Niwas' WHERE firstName = 'Vidhya';
--SELECT * FROM AddressBook;
Alter table AddressBook Drop column phoneNumber;
Alter table AddressBook Add phoneNumber BIGINT;

Drop table AddressBook;

/* UC2 */
create table AddressBook
(
firstName Varchar(255),
lastName varchar(255),
address varchar(255),
city char(255),
state char(255),
zip INT,
phoneNumber BIGINT,
email NVARCHAR(255)
)
SELECT * FROM AddressBook;

/* UC 3 */
INSERT INTO AddressBook VALUES('Vidhya','Darade', 'Aashirvad Niwas', 'Jalna','Maharashtra',431205,1234567815,'vidhyadarade47@gmail.com');
INSERT INTO AddressBook VALUES('Ganesh','Mundhe', 'Aashirvad Niwas', 'Jalna','Maharashtra',512436,7894561235,'ganeshmundhe456@gmail.com');
INSERT INTO AddressBook VALUES('Vishal','Darade', 'Sarswati complex', 'vadodra','Gujrat',857691,4561237895,'vishaldarade54@gmail.com');
INSERT INTO AddressBook VALUES('Vidhya','Darade', 'Aashirvad Niwas', 'Benguluru','Karnatka',512346,7891234568,'vaibhavdarade158@gmail.com');

SELECT * FROM AddressBook;


/* UC4 */
Update AddressBook SET address = 'Matoshri Niwas' WHERE firstName = 'Vidhya';
SELECT * FROM AddressBook;

Update AddressBook SET firstName = 'Vaibhav' where email = 'vaibhavdarade158@gmail.com';
Update AddressBook SET address = 'GURU MAHAl' where email = 'vaibhavdarade158@gmail.com';
Update AddressBook SET city = 'Benguluru' where email = 'vaibhavdarade158@gmail.com';
Update AddressBook SET state = 'Karnatka' where email = 'vaibhavdarade158@gmail.com';
SELECT * FROM AddressBook;

/* UC5 */
INSERT INTO AddressBook VALUES('Ankita','Sonwane', 'Sarthi', 'Pune','Maharashtra',513468,9548621458,'ankitamundhe5148@gmail.com');
DELETE FROM AddressBook WHERE firstName = 'Ankita';
SELECT * FROM AddressBook;

/* UC6 */
SELECT firstName, lastName, address, state, zip, phoneNumber, email from AddressBook where city = 'benguluru';
SELECT firstName, lastName, address, city, zip, phoneNumber, email from AddressBook where state = 'Gujrat';

/* UC7 */
SELECT city, count(city) from AddressBook Group BY city;
SELECT state, count(state) from AddressBook Group BY state;

/* UC8 */
SELECT firstName, lastName, address, city, state, zip, phoneNumber, email from AddressBook where city = 'jalna' ORDER BY firstName;

/* UC9 */
alter table AddressBook Add Type VARCHAR(255);
SELECT * from AddressBook;

Update AddressBook SET Type = 'Professional' WHERE firstName = 'Vidhya';
Update AddressBook SET Type = 'Family' WHERE firstName = 'Ganesh';
Update AddressBook SET Type = 'Friend' WHERE firstName = 'Vishal';
Update AddressBook SET Type = 'Friend' WHERE firstName = 'Vaibhav';

/* UC10 */
SELECT Type, COUNT(Type) FROM AddressBook Group BY Type;  

/* UC11 */
INSERT INTO AddressBook VALUES('Ankita','Sonwane', 'Sarthi', 'Pune','Maharashtra',513468,9548621458,'ankitamundhe5148@gmail.com', 'Family');
INSERT INTO AddressBook VALUES('Shivani','Bandger', 'Shanti Niwas', 'Ichalkaranji','Maharashtra',951423,9516284375,'hivanibandger485@gmail.com', 'Friend');
INSERT INTO AddressBook VALUES('Aishwarya','Kusgal', 'Om Niwas', 'Ranchi','Zarkhand',852643,7531598464,'aishwaryakus9@gmail.com', 'Professional');
SELECT * FROM AddressBook;