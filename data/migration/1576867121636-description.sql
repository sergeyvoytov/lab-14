Query 1: CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

This query will create a second table in the lab14_normal database named bookshelves. Confirm the success of this command by typing \d bookshelves in your SQL shell. You should see the bookshelves table schema, as shown above.



Query 2: INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

This query will use a simple subquery to retrieve unique bookshelf values from the books table and insert each one into the bookshelves table in the name column.


Query 3: ALTER TABLE books ADD COLUMN bookshelf_id INT;

This query will add a column to the books table named bookshelf_id. This will connect each book to a specific bookshelf in the other table.


Query 4: UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

This query will prepare a connection between the two tables. It works by running a subquery for every row in the books table. The subquery finds the bookshelf row that has a name matching the current book’s bookshelf value. The id of that bookshelf row is then set as the value of the bookshelf_id property in the current book row.


Query 5: ALTER TABLE books DROP COLUMN bookshelf;

This query will modify the books table by removing the column named bookshelf. Now that the books table contains a bookshelf_id column which will become a foreign key.


Query 6: ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);

This query will modify the data type of the bookshelf_id in the books table, setting it as a foreign key which references the primary key in the bookshelves table. Now PostgreSQL knows HOW these 2 tables are connected.


