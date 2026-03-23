-- Dimension: Date
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    month_name VARCHAR(20) NOT NULL
);

-- Dimension: Store
CREATE TABLE dim_store (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Dimension: Product
CREATE TABLE dim_product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- Fact Table
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    revenue DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- -----------------------
-- INSERT CLEANED DATA
-- -----------------------

-- dim_date (standardized format YYYY-MM-DD)
INSERT INTO dim_date VALUES
(1,'2024-01-01',1,2024,'January'),
(2,'2024-02-01',2,2024,'February'),
(3,'2024-03-01',3,2024,'March');

-- dim_store
INSERT INTO dim_store VALUES
('S1','Delhi Central','Delhi'),
('S2','Mumbai Mall','Mumbai'),
('S3','Bangalore Hub','Bangalore');

-- dim_product (category standardized to proper case)
INSERT INTO dim_product VALUES
('P1','Laptop','Electronics'),
('P2','Shirt','Clothing'),
('P3','Milk','Groceries');

-- fact_sales (NULLs handled, consistent numeric values)
INSERT INTO fact_sales VALUES
(1,1,'S1','P1',2,110000),
(2,1,'S2','P2',5,7500),
(3,1,'S3','P3',10,600),
(4,2,'S1','P1',1,55000),
(5,2,'S2','P3',8,480),
(6,2,'S3','P2',6,9000),
(7,3,'S1','P2',4,6000),
(8,3,'S2','P1',2,110000),
(9,3,'S3','P3',12,720),
(10,3,'S1','P3',7,420);
