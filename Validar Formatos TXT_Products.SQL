--Products

--Validacion integer--
SELECT 
    productID,
    supplierID,
    categoryID,
    unitPrice,
    unitsInStock,
    unitsOnOrder,
    reorderLevel,
    discontinued
FROM TXT_Products
WHERE 
       productID NOT GLOB '[0-9]*'
    OR (supplierID IS NOT NULL AND TRIM(supplierID) <> '' AND supplierID NOT GLOB '[0-9]*')
    OR (categoryID IS NOT NULL AND TRIM(categoryID) <> '' AND categoryID NOT GLOB '[0-9]*')
    OR (
         unitPrice IS NOT NULL AND TRIM(unitPrice) <> '' AND
         unitPrice NOT GLOB '[0-9]*' AND
         unitPrice NOT GLOB '[0-9]*.[0-9]*'
       )
    OR (unitsInStock IS NOT NULL AND TRIM(unitsInStock) <> '' AND unitsInStock NOT GLOB '[0-9]*')
    OR (unitsOnOrder IS NOT NULL AND TRIM(unitsOnOrder) <> '' AND unitsOnOrder NOT GLOB '[0-9]*')
    OR (reorderLevel IS NOT NULL AND TRIM(reorderLevel) <> '' AND reorderLevel NOT GLOB '[0-9]*')
    OR discontinued NOT IN ('0','1');

SELECT 
    productID,
    productName,
    quantityPerUnit
FROM TXT_Products
WHERE 
       productName IS NULL
    OR TRIM(productName) = ''
    OR quantityPerUnit IS NULL
    OR TRIM(quantityPerUnit) = ''
   ;
 INSERT INTO LOG_Ejecucion (
    script_name,
    start_time,
    end_time,
    status,
    rows_affec,
    message
)
VALUES (
    'Validar Formatos TXT_Products.sql',
    datetime('now','-60 seconds'),   -- o reemplazalo por una variable si tenés
    datetime('now'),
    'SUCCESS',
    0,
    'No se encontraron inconsistencias de los tipos de datos'
);


