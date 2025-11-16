--Order details--
-- OrderID no numérico
SELECT orderID
FROM TXT_Order_Details
WHERE orderID NOT GLOB '[0-9]*';

-- ProductID no numérico
SELECT productID
FROM TXT_Order_Details
WHERE productID NOT GLOB '[0-9]*';

-- UnitPrice no numérico (real)
SELECT unitPrice
FROM TXT_Order_Details
WHERE unitPrice IS NOT NULL AND TRIM(UnitPrice) <> ''
  AND unitPrice NOT GLOB '[0-9]*'
  AND unitPrice NOT GLOB '[0-9]*.[0-9]*';

-- Quantity no numérico
SELECT quantity
FROM TXT_Order_Details
WHERE quantity NOT GLOB '[0-9]*';

-- Discount no numérico (real)
SELECT discount
FROM TXT_Order_Details
WHERE discount IS NOT NULL AND TRIM(Discount) <> ''
  AND discount NOT GLOB '[0-9]*'
  AND discount NOT GLOB '[0-9]*.[0-9]*';
 INSERT INTO LOG_Ejecucion (
    script_name,
    start_time,
    end_time,
    status,
    rows_affec,
    message
)
VALUES (
    'Validar Formatos TXT_Order_Details.sql',
    datetime('now','-60 seconds'),   -- o reemplazalo por una variable si tenés
    datetime('now'),
    'SUCCESS',
    0,
    'No se encontraron inconsistencias de los tipos de datos'
);