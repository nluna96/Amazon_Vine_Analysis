CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_table (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers_table (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);


Select count(*) from review_id_table;
Select * from review_id_table limit 100;

Select count(*) from products_table;
Select * from products_table limit 100;

Select count(*) from customers_table;
Select * from customers_table limit 100;

---4850360
Select count(*) from vine_table;
Select * from vine_table limit 100;

Select * INTO filtered_vine_table from vine_table where total_votes >= 20;

---67855
Select count(*) from filtered_vine_table;


Select * INTO helpful_total_vine_table from filtered_vine_table WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;

----61948
Select count(*) from helpful_total_vine_table;

Select * INTO paid_vine_table from helpful_total_vine_table where vine = 'Y';

---334
Select count(*) from paid_vine_table;

Select * INTO unpaid_vine_table from helpful_total_vine_table where vine = 'N';

---61614
Select count(*) from unpaid_vine_table;

---139
Select count(*) from paid_vine_table where star_rating = 5;

---32665
Select count(*) from unpaid_vine_table where star_rating = 5;