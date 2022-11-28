TRUNCATE TABLE items RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO items (item_name, unit_price, stock) VALUES ('Hoover', 70.00, 10);
INSERT INTO items (item_name, unit_price, stock) VALUES ('Fire wood', 12.99, 50);
