SELECT categoryID
FROM TXT_Categories
WHERE categoryID IS NULL
   OR TRIM(categoryID) = '';

-- PK duplicada
SELECT categoryID, COUNT(*) AS qty
FROM TXT_Categories
GROUP BY categoryID
HAVING COUNT(*) > 1;


---------------------------------------------------------------
-- 2) PRODUCTS (PK: product_id)
---------------------------------------------------------------

SELECT productID
FROM TXT_Products
WHERE productID IS NULL
   OR TRIM(productID) = '';

SELECT productID, COUNT(*) AS qty
FROM TXT_Products
GROUP BY productID
HAVING COUNT(*) > 1;


---------------------------------------------------------------
-- 3) SUPPLIERS (PK: supplier_id)
---------------------------------------------------------------

SELECT supplierID
FROM TXT_Suppliers
WHERE supplierID IS NULL
   OR TRIM(supplierID) = '';

SELECT supplierID, COUNT(*) AS qty
FROM TXT_Suppliers
GROUP BY supplierID
HAVING COUNT(*) > 1;


---------------------------------------------------------------
-- 4) EMPLOYEES (PK: employee_id)
---------------------------------------------------------------

SELECT employeeID
FROM TXT_Employees
WHERE employeeID IS NULL
   OR TRIM(employeeID) = '';

SELECT employeeID, COUNT(*) AS qty
FROM TXT_Employees
GROUP BY employeeID
HAVING COUNT(*) > 1;


---------------------------------------------------------------
-- 5) REGION (PK: region_id)
---------------------------------------------------------------

SELECT regionID
FROM TXT_Regions
WHERE regionID IS NULL
   OR TRIM(regionID) = '';

SELECT regionID, COUNT(*) AS qty
FROM TXT_Regions
GROUP BY regionID
HAVING COUNT(*) > 1;


---------------------------------------------------------------
-- 6) TERRITORIES (PK: territory_id - texto)
---------------------------------------------------------------

SELECT territoryID
FROM TXT_Territories
WHERE territoryID IS NULL
   OR TRIM(territoryID) = '';

SELECT territoryID, COUNT(*) AS qty
FROM TXT_Territories
GROUP BY territoryID
HAVING COUNT(*) > 1;


---------------------------------------------------------------
-- 7) EMPLOYEE_TERRITORIES (PK compuesta: employee_id, territory_id)
---------------------------------------------------------------

-- Algún componente de la PK nulo / vacío
SELECT employeeID, territoryID
FROM TXT_EmployeeTerritories
WHERE employeeID IS NULL
   OR TRIM(employeeID) = ''
   OR territoryID IS NULL
   OR TRIM(territoryID) = '';

-- Combinación PK duplicada
SELECT employeeID, territoryID, COUNT(*) AS qty
FROM TXT_EmployeeTerritories
GROUP BY employeeID, territoryID
HAVING COUNT(*) > 1;


---------------------------------------------------------------
-- 8) CUSTOMERS (PK: customer_id)
---------------------------------------------------------------

SELECT customerID
FROM TXT_Customers
WHERE customerID IS NULL
   OR TRIM(customerID) = '';

SELECT customerID, COUNT(*) AS qty
FROM TXT_Customers
GROUP BY customerID
HAVING COUNT(*) > 1;


---------------------------------------------------------------
-- 9) ORDERS (PK: order_id)
---------------------------------------------------------------

SELECT orderID
FROM TXT_Orders
WHERE orderID IS NULL
   OR TRIM(orderID) = '';

SELECT orderID, COUNT(*) AS qty
FROM TXT_Orders
GROUP BY orderID
HAVING COUNT(*) > 1;


---------------------------------------------------------------
-- 10) ORDER_DETAILS (PK compuesta: order_id, product_id)
---------------------------------------------------------------

SELECT orderID, productID
FROM TXT_Order_Details
WHERE orderID IS NULL
   OR TRIM(orderID) = ''
   OR productID IS NULL
   OR TRIM(productID) = '';

SELECT orderID, productID, COUNT(*) AS qty
FROM TXT_Order_Details
GROUP BY orderID, productID
HAVING COUNT(*) > 1;


---------------------------------------------------------------
---------------------------------------------------------------
-- 13) SHIPPERS (PK: shipper_id)
---------------------------------------------------------------

SELECT shipperID
FROM TXT_Shippers
WHERE shipperID IS NULL
   OR TRIM(shipperID) = '';

SELECT shipperID, COUNT(*) AS qty
FROM TXT_Shippers
GROUP BY shipperID
HAVING COUNT(*) > 1;

INSERT INTO LOG_Ejecucion (
    script_name,
    start_time,
    end_time,
    status,
    rows_affected,
    message
)
VALUES (
    'Validar_PK_TXT.sql',
    datetime('now','-60 seconds'),
    datetime('now'),
    'SUCCESS',
    (
        (SELECT COUNT(*) FROM TXT_Categories
          WHERE categoryID IS NULL OR TRIM(categoryID) = '')
      + (SELECT COUNT(*) FROM (
             SELECT categoryID
             FROM TXT_Categories
             GROUP BY categoryID
             HAVING COUNT(*) > 1
         ))

      + (SELECT COUNT(*) FROM TXT_Products
          WHERE productID IS NULL OR TRIM(productID) = '')
      + (SELECT COUNT(*) FROM (
             SELECT productID
             FROM TXT_Products
             GROUP BY productID
             HAVING COUNT(*) > 1
         ))

      + (SELECT COUNT(*) FROM TXT_Suppliers
          WHERE supplierID IS NULL OR TRIM(supplierID) = '')
      + (SELECT COUNT(*) FROM (
             SELECT supplierID
             FROM TXT_Suppliers
             GROUP BY supplierID
             HAVING COUNT(*) > 1
         ))

      + (SELECT COUNT(*) FROM TXT_Employees
          WHERE employeeID IS NULL OR TRIM(employeeID) = '')
      + (SELECT COUNT(*) FROM (
             SELECT employeeID
             FROM TXT_Employees
             GROUP BY employeeID
             HAVING COUNT(*) > 1
         ))

      + (SELECT COUNT(*) FROM TXT_Regions
          WHERE regionID IS NULL OR TRIM(regionID) = '')
      + (SELECT COUNT(*) FROM (
             SELECT regionID
             FROM TXT_Regions
             GROUP BY regionID
             HAVING COUNT(*) > 1
         ))

      + (SELECT COUNT(*) FROM TXT_Territories
          WHERE territoryID IS NULL OR TRIM(territoryID) = '')
      + (SELECT COUNT(*) FROM (
             SELECT territoryID
             FROM TXT_Territories
             GROUP BY territoryID
             HAVING COUNT(*) > 1
         ))

      + (SELECT COUNT(*) FROM TXT_EmployeeTerritories
          WHERE employeeID IS NULL OR TRIM(employeeID) = ''
             OR territoryID IS NULL OR TRIM(territoryID) = '')
      + (SELECT COUNT(*) FROM (
             SELECT employeeID, territoryID
             FROM TXT_EmployeeTerritories
             GROUP BY employeeID, territoryID
             HAVING COUNT(*) > 1
         ))

      + (SELECT COUNT(*) FROM TXT_Customers
          WHERE customerID IS NULL OR TRIM(customerID) = '')
      + (SELECT COUNT(*) FROM (
             SELECT customerID
             FROM TXT_Customers
             GROUP BY customerID
             HAVING COUNT(*) > 1
         ))

      + (SELECT COUNT(*) FROM TXT_Orders
          WHERE orderID IS NULL OR TRIM(orderID) = '')
      + (SELECT COUNT(*) FROM (
             SELECT orderID
             FROM TXT_Orders
             GROUP BY orderID
             HAVING COUNT(*) > 1
         ))

      + (SELECT COUNT(*) FROM TXT_Order_Details
          WHERE orderID IS NULL OR TRIM(orderID) = ''
             OR productID IS NULL OR TRIM(productID) = '')
      + (SELECT COUNT(*) FROM (
             SELECT orderID, productID
             FROM TXT_Order_Details
             GROUP BY orderID, productID
             HAVING COUNT(*) > 1
         ))

      + (SELECT COUNT(*) FROM TXT_Shippers
          WHERE shipperID IS NULL OR TRIM(shipperID) = '')
      + (SELECT COUNT(*) FROM (
             SELECT shipperID
             FROM TXT_Shippers
             GROUP BY shipperID
             HAVING COUNT(*) > 1
         ))
    ),
    'Validación de claves primarias en todas las tablas TXT'
);

