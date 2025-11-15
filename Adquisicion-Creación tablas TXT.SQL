-- TABLA TMP_Categories
CREATE TABLE TMP_Categories (
    categoryID INTEGER PRIMARY KEY,
    categoryName TEXT,
    description TEXT,
    picture TEXT
);

-- TABLA TMP_Customers
CREATE TABLE TMP_Customers (
    customerID TEXT PRIMARY KEY,
    companyName TEXT,
    contactName TEXT,
    contactTitle TEXT,
    address TEXT,
    city TEXT,
    region TEXT,
    postalCode TEXT,
    country TEXT,
    phone TEXT,
    fax TEXT
);

-- TABLA TMP_Employees
CREATE TABLE TMP_Employees (
    employeeID INTEGER PRIMARY KEY,
    lastName TEXT,
    firstName TEXT,
    title TEXT,
    titleOfCourtesy TEXT,
    birthDate TEXT, -- SQLite usa TEXT para fechas
    hireDate TEXT,  -- SQLite usa TEXT para fechas
    address TEXT,
    city TEXT,
    region TEXT,
    postalCode TEXT,
    country TEXT,
    homePhone TEXT,
    extension TEXT,
    photo TEXT,
    notes TEXT,
    reportsTo INTEGER, -- Es una Clave Foránea (FK)
    photoPath TEXT
);

-- TABLA TMP_EmployeeTerritories (Clave Compuesta)
CREATE TABLE TMP_EmployeeTerritories (
    employeeID INTEGER,
    territoryID TEXT,
    PRIMARY KEY (employeeID, territoryID)
);

-- TABLA TMP_Order_Details (Clave Compuesta)
CREATE TABLE TMP_Order_Details (
    orderID INTEGER,
    productID INTEGER,
    unitPrice REAL,
    quantity INTEGER,
    discount REAL,
    PRIMARY KEY (orderID, productID)
);

-- TABLA TMP_Products
CREATE TABLE TMP_Products (
    productID INTEGER PRIMARY KEY,
    productName TEXT,
    supplierID INTEGER, -- FK
    categoryID INTEGER, -- FK
    quantityPerUnit TEXT,
    unitPrice REAL,
    unitsInStock INTEGER,
    unitsOnOrder INTEGER,
    reorderLevel INTEGER,
    discontinued INTEGER -- 0 o 1
);

-- TABLA TMP_Regions
CREATE TABLE TMP_Regions (
    regionID INTEGER PRIMARY KEY,
    regionDescription TEXT
);

-- TABLA TMP_Shippers
CREATE TABLE TMP_Shippers (
    shipperID INTEGER PRIMARY KEY,
    companyName TEXT,
    phone TEXT
);

-- TABLA TMP_Suppliers
CREATE TABLE TMP_Suppliers (
    supplierID INTEGER PRIMARY KEY,
    companyName TEXT,
    contactName TEXT,
    contactTitle TEXT,
    address TEXT,
    city TEXT,
    region TEXT,
    postalCode TEXT,
    country TEXT,
    phone TEXT,
    fax TEXT,
    homePage TEXT
);

-- TABLA TMP_Territories
CREATE TABLE TMP_Territories (
    territoryID TEXT PRIMARY KEY,
    territoryDescription TEXT,
    regionID INTEGER -- FK
);