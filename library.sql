CREATE TABLE authors(
	author_id SERIAL PRIMARY KEY,
	author_name VARCHAR(80) NOT NULL
				   ) ; 
CREATE TABLE publishers(
	publisher_id SERIAL PRIMARY KEY,
	publisher_name TEXT UNIQUE NOT NULL,
	address VARCHAR(250) NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL
				   ) ; 
CREATE TABLE branchs(
	branch_id SERIAL PRIMARY KEY,
	branch_name TEXT UNIQUE NOT NULL,
	address VARCHAR(250) NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL
				   ) ; 

CREATE TABLE employees(
	employee_id SERIAL PRIMARY KEY,
	employee_full_name VARCHAR(200) NOT NULL,
	salary INTEGER NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(320) UNIQUE NOT NULL,
	position VARCHAR(200) NOT NULL
				   ) ; 
CREATE TABLE members(
	member_id SERIAL PRIMARY KEY,
	full_name VARCHAR(200) NOT NULL,
	member_type VARCHAR(100) NOT NULL,
	address TEXT NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(320) UNIQUE NOT NULL,
	member_date TIMESTAMP NOT NULL
				   ) ; 

CREATE TABLE books(
	book_id SERIAL PRIMARY KEY,
	ISBN VARCHAR(13) UNIQUE NOT NULL,
	book_title VARCHAR(200) NOT NULL,
	author_name TEXT UNIQUE NOT NULL,
	publisher_name VARCHAR(200) NOT NULL,
	available BOOLEAN NOT NULL,
	genre VARCHAR(100) NOT NULL,
	publish_year INTEGER NOT NULL
				   );

CREATE TABLE loan(
	branch_id INTEGER REFERENCES branchs(branch_id),
	member_id INTEGER REFERENCES members(member_id),
	book_id INTEGER REFERENCES books(book_id),
	loan_date DATE NOT NULL,
	due_date DATE NOT NULL,
	return_date DATE
				   );

CREATE TABLE book_inventory(
	branch_id INTEGER REFERENCES branchs(branch_id),
	book_id INTEGER REFERENCES books(book_id),
	no_of_copy SMALLINT NOT NULL
				   );
				   
CREATE VIEW book_author AS
SELECT author_id , book_id , book_title  FROM books
INNER JOIN authors
ON books.author_name=authors.author_name;

INSERT INTO publishers(publisher_name, address, phone)
VALUES 
('Penguin' ,'ABC Street NY USA' , '001-202-500200' );

INSERT INTO authors(author_name)
VALUES 
('Franz Kafka' );

INSERT INTO books(isbn , book_title, available, genre, publish_year, publisher_name, author_name)
VALUES 
('1234567891012', 'The Trial' , TRUE, 'Modernism', 2018 , 'Penguin', 'Franz Kafka');

INSERT INTO branchs(branch_name , address, phone )
VALUES ('A Library','Washington DC','001-202-300200');

INSERT INTO book_inventory(branch_id , book_id, no_of_copy )
VALUES (1,1,10);

INSERT INTO employees(employee_full_name , salary, phone , email , position)
VALUES ('Jack Norton', 2800, '001-202-509-6995','jack.norton@gmail.com','Librarian');


INSERT INTO members(full_name, phone , email , member_type , address, member_date)
VALUES ('Lisa Brooks', '001-202-505-6995','lisa.brooks@gmail.com','Premium', 'AB Street Washington DC', CURRENT_TIMESTAMP);

INSERT INTO loan(branch_id, member_id , book_id , loan_date , due_date)
values ( 1,1,1,to_date('2021-05-02', 'YYYY-MM-DD') , to_date('2021-06-02', 'YYYY-MM-DD'));

SELECT * FROM loan;
SELECT * FROM members;
SELECT * FROM publishers;
SELECT * FROM books;
SELECT * FROM employees;
SELECT * FROM branchs;
SELECT * FROM book_inventory;
SELECT * FROM authors;


