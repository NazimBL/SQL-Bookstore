CREATE TABLE BOOKS (
  isbn int PRIMARY KEY,
  Title varchar(100),
  Release_year varchar(4),
  price float
);

CREATE TABLE Publishers (
  pub_id int PRIMARY KEY,
  city varchar(40),
  Name varchar(100)
);

CREATE TABLE People (
  p_id int PRIMARY KEY,
  ssn varchar(12),
  name varchar(50),
  address varchar(100)
);

CREATE TABLE Authorship (
  book int,
  author int
);

CREATE TABLE Publishing (
  book int,
  publisher int
);

CREATE TABLE Orders (
  o_id int PRIMARY KEY,
  o_date date,
  buyer int
);

CREATE TABLE Purchase (
  p_order int,
  book int,
  amount int
);

ALTER TABLE Authorship ADD FOREIGN KEY (book) REFERENCES BOOKS (isbn) on delete cascade;

ALTER TABLE Authorship ADD FOREIGN KEY (author) REFERENCES People (p_id);

ALTER TABLE Publishing ADD FOREIGN KEY (book) REFERENCES BOOKS (isbn) ON DELETE CASCADE;

ALTER TABLE Publishing ADD FOREIGN KEY (publisher) REFERENCES Publishers (pub_id) ON DELETE CASCADE;

ALTER TABLE Orders ADD FOREIGN KEY (buyer) REFERENCES People (p_id) ON DELETE CASCADE;

ALTER TABLE Purchase ADD FOREIGN KEY (p_order) REFERENCES Orders (o_id) ON DELETE CASCADE;

ALTER TABLE Purchase ADD FOREIGN KEY (book) REFERENCES BOOKS (isbn) ON DELETE CASCADE;

/*ALTER TABLE People ADD CONSTRAINT UC_people UNIQUE (name,ssn);*/

INSERT INTO Publishers
VALUES (1, 'Lowell', 'Lowell Ultrabooks');
INSERT INTO Publishers
VALUES (2, 'NYC', 'Comics SUX LTD');
INSERT INTO Publishers
VALUES (3, 'Boston', 'Academic Publising Co');
INSERT INTO Publishers
VALUES (4, 'Chicago', 'Windy City Ltd');
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (1, '1984', '1949', 4.7);
INSERT INTO Publishing (book, publisher)
VALUES (1, 1);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (2, '1985', '1961', 5.0);
INSERT INTO Publishing (book, publisher)
VALUES (2,1);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (3, '1984 part II extended', '1962', 7.7);
INSERT INTO Publishing (book, publisher)
VALUES (3,1);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (4, 'Batman Loses to Everybody', '2021', 10.5);
INSERT INTO Publishing (book, publisher)
VALUES (4,3);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (5, 'Superman wins Everybody even Batman', '2021', 30.55);
INSERT INTO Publishing (book, publisher)
VALUES (5,3);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (6, 'Pandemics is coming', '2018', 7.5);
INSERT INTO Publishing (book, publisher)
VALUES (6,2);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (7, 'How to repair an idiot', '2012', 10.8);
INSERT INTO Publishing (book, publisher)
VALUES (7,2);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (8, 'How to repair a wife', '2021', 9.8);
INSERT INTO Publishing (book, publisher)
VALUES (8,2);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (9, 'Blasphemy for Dummies', '2019', 5.0);
INSERT INTO Publishing (book, publisher)
VALUES (9,2);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (10, 'Frank Millers Zak Snyder', '2020', 55.5);
INSERT INTO Publishing (book, publisher)
VALUES (10,3);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (11, 'On The Road', '2021', 100.99);
INSERT INTO Publishing (book, publisher)
VALUES (11,2);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (12, 'Blasphemy for Dummies', '2021', 5.0);
INSERT INTO Publishing (book, publisher)
VALUES (12,4);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (13, 'A girl who cooked and ate her face after an intercourse', '2020', 1.0);
INSERT INTO Publishing (book, publisher)
VALUES (13,4);
INSERT INTO BOOKS (isbn, Title, Release_year, price)
VALUES (14, 'A drug addict shining in the plane cabin', '2018', 2.0);
INSERT INTO Publishing (book, publisher)
VALUES (14,4);
INSERT INTO People (p_id, ssn, name, address)
VALUES (201, '100-200-300', 'Alex Dralex', '01010 1 Binary st, Zero town, Terabitia');
INSERT INTO People (p_id, ssn, name, address)
VALUES (231, '105-207-309', 'Test Buyer', '00001, 1 Washington st, Washington DC, USA');
INSERT INTO People (p_id, ssn, name, address)
VALUES (302, '111-222-333', 'Sofus Lee', '30161 15, Elyssius st, Rome, GA, USA');
INSERT INTO People (p_id, ssn, name, address)
VALUES (203, '123-456-789', 'George Orwell', ' 50 Lawford Road, Kentish Town, London NW5 2LN, London Borough of Camden');
INSERT INTO People (p_id, ssn, name, address)
VALUES (204, '101-102-103', 'George Notorwell', '49 Crimedodge Highway, Enemish City, Paris, France');
INSERT INTO People (p_id, ssn, name, address)
VALUES (305, '222-222-222', 'Mickey Fanboy', '01852, 444 Pawtucket, Lowell, MA, USA');
INSERT INTO People (p_id, ssn, name, address)
VALUES (306, '333-333-333', 'Melissa The Wise Woman', '555, 225 Sunshine Ave, SFC, California, USA');
INSERT INTO People (p_id, ssn, name, address)
VALUES (307, '666-666-666', 'Satan Jr.', 'Subhell 2, Hell');
INSERT INTO People (p_id, ssn, name, address)
VALUES (308, '308-308-308', 'Stephen King', 'Subhell 3, Hell Crossroads');
INSERT INTO Authorship(book, author)
VALUES (14,308);
INSERT INTO Authorship(book, author)
VALUES (13,308);
INSERT INTO Authorship(book, author)
VALUES (1,203);
INSERT INTO Authorship(book, author)
VALUES (2,305);
INSERT INTO Authorship(book, author)
VALUES (3,305);
INSERT INTO Authorship(book, author)
VALUES (4,305);
INSERT INTO Authorship(book, author)
VALUES (5,306);
INSERT INTO Authorship(book, author)
VALUES (6,302);
INSERT INTO Authorship(book, author)
VALUES (7,306);
INSERT INTO Authorship(book, author)
VALUES (8,306);
INSERT INTO Authorship(book, author)
VALUES (9,306);
INSERT INTO Authorship(book, author)
VALUES (10,305);
INSERT INTO Authorship(book, author)
VALUES (11,307);
INSERT INTO Authorship(book, author)
VALUES (12,307);
INSERT INTO Orders (o_id, o_date, buyer)
VALUES (501, '17/DEC/2015', 201);
INSERT INTO Purchase (p_order, book, amount)
VALUES (501, 1, 2);
INSERT INTO Purchase (p_order, book, amount)
VALUES (501, 2, 3);
INSERT INTO Orders (o_id, o_date, buyer)
VALUES (502, '18/OCT/2021', 231);
INSERT INTO Purchase (p_order, book, amount)
VALUES (502, 1, 5);
INSERT INTO Purchase (p_order, book, amount)
VALUES (502, 2, 5);
INSERT INTO Purchase (p_order, book, amount)
VALUES (502, 3, 5);
INSERT INTO Purchase (p_order, book, amount)
VALUES (502, 4, 5);
INSERT INTO Purchase (p_order, book, amount)
VALUES (502, 13, 1);
INSERT INTO Purchase (p_order, book, amount)
VALUES (502, 14, 2);
INSERT INTO Orders (o_id, o_date, buyer)
VALUES (503, '16/OCT/2022', 305);
INSERT INTO Purchase (p_order, book, amount)
VALUES (503, 4, 1);
INSERT INTO Purchase (p_order, book, amount)
VALUES (503, 5, 1);
INSERT INTO Orders (o_id, o_date, buyer)
VALUES (504, '21/JAN/2021', 306);
INSERT INTO Purchase (p_order, book, amount)
VALUES (504, 4, 1);
INSERT INTO Purchase (p_order, book, amount)
VALUES (504, 5, 1);
INSERT INTO Orders (o_id, o_date, buyer)
VALUES (505, '12/DEC/2021', 204);
INSERT INTO Purchase (p_order, book, amount)
VALUES (505, 9, 1);
INSERT INTO Purchase (p_order, book, amount)
VALUES (505, 8, 1);
INSERT INTO Orders (o_id, o_date, buyer)
VALUES (506, '12/FEB/2020', 302);
INSERT INTO Purchase (p_order, book, amount)
VALUES (506, 1, 5);
INSERT INTO Purchase (p_order, book, amount)
VALUES (506, 14, 1);

