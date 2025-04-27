CREATE TABLE Customer (
    Customer_ID VARCHAR PRIMARY KEY,
    Customer_Name TEXT,
    Segment TEXT,
    City TEXT,
    "State" TEXT,
    Region TEXT
);

CREATE TABLE Product (
    Product_ID VARCHAR PRIMARY KEY,
    Product_Name TEXT,
    Category TEXT
);

CREATE TABLE "Order" (
    Order_ID VARCHAR PRIMARY KEY,
    Customer_ID VARCHAR REFERENCES Customer(Customer_ID),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode TEXT,
    Order_Priority TEXT,
    Shipping_Cost DECIMAL  
);

CREATE TABLE Order_Details (
    Order_ID VARCHAR REFERENCES "Order"(Order_ID),
    Product_ID VARCHAR REFERENCES Product(Product_ID),
    Sales DECIMAL,
    Quantity INT,
    Discount DECIMAL,
    Profit DECIMAL,
    PRIMARY KEY (Order_ID, Product_ID)
);
