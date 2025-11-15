--Creación de tablas TXT
CREATE TABLE TXT_Orders (
    orderID TEXT,
    customerID TEXT,
    employeeID TEXT,
    orderDate TEXT,
    requiredDate TEXT,
    shippedDate TEXT,
    shipVia TEXT,
    freight TEXT,
    shipName TEXT,
    shipAddress TEXT,
    shipCity TEXT,
    shipRegion TEXT,
    shipPostalCode TEXT,
    shipCountry TEXT
);
-- TABLA TXT_Categories
CREATE TABLE TXT_Categories (
    categoryID TEXT,
    categoryName TEXT,
    description TEXT,
    picture TEXT
);

-- TABLA TXT_Customers
CREATE TABLE TXT_Customers (
    customerID TEXT,
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

-- TABLA TXT_Employees
CREATE TABLE TXT_Employees (
    employeeID TEXT,
    lastName TEXT,
    firstName TEXT,
    title TEXT,
    titleOfCourtesy TEXT,
    birthDate TEXT,
    hireDate TEXT,
    address TEXT,
    city TEXT,
    region TEXT,
    postalCode TEXT,
    country TEXT,
    homePhone TEXT,
    extension TEXT,
    photo TEXT,
    notes TEXT,
    reportsTo TEXT,
    photoPath TEXT
);

-- TABLA TXT_EmployeeTerritories
CREATE TABLE TXT_EmployeeTerritories (
    employeeID TEXT,
    territoryID TEXT
);

-- TABLA TXT_Order_Details
CREATE TABLE TXT_Order_Details (
    orderID TEXT,
    productID TEXT,
    unitPrice TEXT,
    quantity TEXT,
    discount TEXT
);

-- TABLA TXT_Products
CREATE TABLE TXT_Products (
    productID TEXT,
    productName TEXT,
    supplierID TEXT,
    categoryID TEXT,
    quantityPerUnit TEXT,
    unitPrice TEXT,
    unitsInStock TEXT,
    unitsOnOrder TEXT,
    reorderLevel TEXT,
    discontinued TEXT
);

-- TABLA TXT_Regions
CREATE TABLE TXT_Regions (
    regionID TEXT,
    regionDescription TEXT
);

-- TABLA TXT_Shippers
CREATE TABLE TXT_Shippers (
    shipperID TEXT,
    companyName TEXT,
    phone TEXT
);

-- TABLA TXT_Suppliers
CREATE TABLE TXT_Suppliers (
    supplierID TEXT,
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

-- TABLA TXT_Territories
CREATE TABLE TXT_Territories (
    territoryID TEXT,
    territoryDescription TEXT,
    regionID TEXT
);