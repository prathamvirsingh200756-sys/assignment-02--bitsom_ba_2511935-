Tables (3NF compliant)

Customers
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

Producers
CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

SalesReps
CREATE TABLE SalesReps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(200) NOT NULL
);

Orders
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesReps(sales_rep_id)
);

OrderItems
CREATE TABLE OrderItems (
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


Sample Inserts (5 per table)

Customers
INSERT INTO Customers VALUES
('CUST101','Rahul Sharma','rahul@gmail.com','Delhi'),
('CUST102','Priya Mehta','priya@gmail.com','Mumbai'),
('CUST103','Amit Verma','amit@gmail.com','Bangalore'),
('CUST104','Neha Singh','neha@gmail.com','Delhi'),
('CUST105','Arjun Kapoor','arjun@gmail.com','Mumbai');

Products
INSERT INTO Products VALUES
('P101','Laptop','Electronics',55000),
('P102','Phone','Electronics',20000),
('P103','Shoes','Fashion',3000),
('P104','Watch','Accessories',5000),
('P105','Bag','Fashion',2500);

SalesReps
INSERT INTO SalesReps VALUES
('SR01','Raj Malhotra','raj@company.com','Delhi Office'),
('SR02','Simran Kaur','simran@company.com','Mumbai HQ'),
('SR03','Vikram Rao','vikram@company.com','Bangalore Office'),
('SR04','Anita Desai','anita@company.com','Delhi Office'),
('SR05','Karan Shah','karan@company.com','Mumbai HQ');

Orders
INSERT INTO Orders VALUES
('ORD1001','CUST101','SR01','2024-01-10'),
('ORD1002','CUST102','SR02','2024-01-11'),
('ORD1003','CUST103','SR03','2024-01-12'),
('ORD1004','CUST104','SR04','2024-01-13'),
('ORD1005','CUST105','SR05','2024-01-14');

OrderItems
INSERT INTO OrderItems VALUES
('ORD1001','P101',1),
('ORD1002','P102',2),
('ORD1003','P103',1),
('ORD1004','P104',3),
('ORD1005','P105',2);
