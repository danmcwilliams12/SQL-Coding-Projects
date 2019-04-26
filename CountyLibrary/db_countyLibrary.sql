CREATE DATABASE db_countyLibrary;
USE db_countyLibrary;



CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY,
	BranchName VARCHAR(50) NOT NULL,
	BranchAddress VARCHAR(50) NOT NULL
);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(50) NOT NULL,
	PublisherPhone VARCHAR(50) NOT NULL
);

CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY,
	BorrowerName VARCHAR(50) NOT NULL,
	BorrowerAddress VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY, 
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PUBLISHER_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_BOOKS_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_LIBRARY_BRANCH_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_BORROWER_CardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL CONSTRAINT fk_BOOKS_BookID2 FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_BOOKS_BookID3 FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT  fk_LIBRARY_BRANCH_BranchID2 FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

INSERT INTO LIBRARY_BRANCH	
	(BranchName, BranchAddress)
	VALUES
	('Sharpstown', '462 Rocky Road'),
	('Central', '7831 Chestnut Street'),
	('Canton', '9000 Cleveland Ave'),
	('Jackson', '4523 High Street')
;	

INSERT INTO PUBLISHER
	(PublisherName, PublisherAddress, PublisherPhone)
	VALUES
	('Toddler Books', '421 Small Creek Road', '330-675-8920'),
	('Treetop', '3085 Killahan Road', '765-224-0007'),
	('Riverboat', '2200 Market Ave', '489-771-8720'),
	('Global Books', '284 International Way', '840-333-3337'),
	('Gateway', '1943 Everhard Road', '600-343-4299'),
	('Spooky Books', '9830 Beach Street', '666-6666-6666'),
	('Greenhouse Press', '4040 12th Street', '749-224-6621')
;

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('The House on the Hill', 'Riverboat'),
	('Into the Storm', 'Greenhouse Press'),
	('The Toy that Could Talk', 'Toddler Books'),
	('Time Stories', 'Gateway'),
	('The Lost Tribe', 'Treetop'),
	('Many Moons Ago', 'Gateway'),
	('The Things My Father Told Me', 'Riverboat'),
	('Vacation in France', 'Global Books'),
	('WWII: A complete History', 'Treetop'),
	('The art of Yodeling', 'Gateway'),
	('This Ain''t Real Life', 'Riverboat'),
	('Fluffy Kittens', 'Toddler Books'),
	('Don''t Eat That', 'Greenhouse Press'),
	('And Then There Were Some', 'Spooky Books'),
	('The Lord of The Braclet', 'Riverboat'),
	('How Chocolate is Made', 'Greenhouse Press'),
	('The Evil Within', 'Spooky Books'),
	('Drew Goes to the Zoo', 'Toddler Books'),
	('The Mystery of the Looney Library', 'Treetop'),
	('Walk Like a Champion', 'Global Books')
; 


INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	('1', 'James Dean'),
	('2', 'Stephen King'),
	('3', 'Max Born'),
	('4', 'Frodo Baggins'),
	('5', 'Sara Jones'),
	('6', 'Joseph Smeller'),
	('7', 'Rachel Thompson'),
	('8', 'Rick Steve'),
	('9', 'Devon Ambrose'),
	('10', 'Zach Talbert'),
	('11', 'Frodo Baggins'),
	('12', 'Max Born'),
	('13', 'Gordon Mamsy'),
	('14', 'Stephen King'),
	('15', 'Frodo Baggins'),
	('16', 'Rick Steve'),
	('17', 'Stephen King'),
	('18', 'James Dean'),
	('19', 'Sara Jones'),
	('20', 'Rachel Thompson')
;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	('1', '1', '3'),
	('2', '1', '4'),
	('5', '1', '2'),
	('6', '1', '2'),
	('8', '1', '3'),
	('12', '1', '3'),
	('13', '1', '2'),
	('15', '1', '4'),
	('17', '1', '2'),
	('20', '1', '2'),
	('3', '2', '2'),
	('4', '2', '3'),
	('7', '2', '2'),
	('9', '2', '2'),
	('11', '2', '4'),
	('13', '2', '3'),
	('14', '2', '2'),
	('17', '2', '2'),
	('18', '2', '3'),
	('19', '2', '2'),
	('1', '3', '3'),
	('4', '3', '2'),
	('5', '3', '4'),
	('8', '3', '2'),
	('9', '3', '2'),
	('10', '3', '2'),
	('11', '3', '4'),
	('15', '3', '4'),
	('16', '3', '3'),
	('20', '3', '2'),
	('2', '4', '4'),
	('3', '4', '2'),
	('6', '4', '2'),
	('7', '4', '3'),
	('10', '4', '2'),
	('12', '4', '2'),
	('14', '4', '3'),
	('16', '4', '2'),
	('18', '4', '2'),
	('19', '4', '4')
;

INSERT INTO BORROWER 
	(BorrowerName, BorrowerAddress, Phone)
	VALUES
	('Jane Doe', '6842 Hill Road', '473-872-9845'),
	('Duke Mitchell', '5732 23rd Street', '549-387-2295'),
	('Sam Seaborn', '9921 High Street', '767-443-2871'),
	('John Singly', '332 Wales Ave', '330-447-9943'),
	('Emily Robes', '7729 Cherry Street', '584-330-2954'),
	('Mike Crow', '2640 Mega Street', '565-208-7678'),
	('Rachel Highwater', '6632 Perry Drive', '434-110-9911'),
	('Trent Marshall', '321 Privet Drive', '626-345-6789'),
	('Nina Banks', '4365 Thompson Way', '232-510-0080'),
	('Dan McWilliams', '4826 Cleveland Ave', '3302097678'),
	('Peter Hash', '6389 Rode Street', '330-329-7675'),
	('Jamie Gill', '2348 Water Way', '443-987-3476')
;

INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	('3', '2', '1', '2019-04-23', '2019-04-28'),
	('7', '2', '1', '2019-04-23', '2019-04-28'),
	('9', '2', '1', '2019-04-23', '2019-04-28'),
	('13', '2', '1', '2019-04-23', '2019-04-28'),
	('14', '2', '1', '2019-04-23', '2019-04-28'),
	('18', '2', '1', '2019-04-23', '2019-04-28'),
	('19', '2', '1', '2019-04-23', '2019-04-28'),
	('2', '4', '2', '2019-04-20', '2019-04-25'),
	('3', '4', '2', '2019-04-20', '2019-04-25'),
	('7', '4', '2', '2019-04-20', '2019-04-25'),
	('12', '4', '3', '2019-04-24', '2019-04-29'),
	('14', '4', '3', '2019-04-24', '2019-04-29'),
	('16', '4', '3', '2019-04-24', '2019-04-29'),
	('18', '4', '3', '2019-04-24', '2019-04-29'),
	('3', '4', '3', '2019-04-24', '2019-04-29'),
	('19', '4', '3', '2019-04-24', '2019-04-29'),
	('12', '1', '4', '2019-04-21', '2019-04-26'),
	('15', '1', '4', '2019-04-21', '2019-04-26'),
	('1', '1', '4', '2019-04-21', '2019-04-26'),
	('2', '1', '4', '2019-04-21', '2019-04-26'),
	('20', '3', '5', '2019-04-25', '2019-04-30'),
	('4', '3', '5', '2019-04-25', '2019-04-30'),
	('16', '3', '5', '2019-04-25', '2019-04-30'),
	('5', '3', '5', '2019-04-25', '2019-04-30'),
	('8', '3', '5', '2019-04-25', '2019-04-30'),
	('11', '3', '5', '2019-04-25', '2019-04-30'),
	('10', '3', '5', '2019-04-25', '2019-04-30'),
	('9', '3', '5', '2019-04-25', '2019-04-30'),
	('6', '1', '6', '2019-04-18', '2019-04-23'),
	('12', '1', '6', '2019-04-18', '2019-04-23'),
	('15', '1', '6', '2019-04-18', '2019-04-23'),
	('4', '2', '7', '2019-04-23', '2019-04-28'),
	('11', '2', '7', '2019-04-23', '2019-04-28'),
	('17', '2', '7', '2019-04-23', '2019-04-28'),
	('3', '2', '7', '2019-04-23', '2019-04-28'),
	('6', '4', '8', '2019-04-20', '2019-04-25'),
	('10', '4', '8', '2019-04-20', '2019-04-25'),
	('19', '4', '8', '2019-04-20', '2019-04-25'),
	('1', '1', '9', '2019-04-25', '2019-04-30'),
	('5', '1', '9', '2019-04-25', '2019-04-30'),
	('8', '1', '9', '2019-04-25', '2019-04-30'),
	('13', '1', '9', '2019-04-25', '2019-04-30'),
	('17', '1', '9', '2019-04-25', '2019-04-30'),
	('20', '1', '9', '2019-04-25', '2019-04-30'),
	('2', '1', '9', '2019-04-25', '2019-04-30'),
	('6', '1', '9', '2019-04-25', '2019-04-30'),
	('7', '2', '10', '2019-04-22', '2019-04-27'),
	('9', '2', '10', '2019-04-22', '2019-04-27'),
	('13', '2', '10', '2019-04-22', '2019-04-27'),
	('19', '2', '10', '2019-04-22', '2019-04-27')
;