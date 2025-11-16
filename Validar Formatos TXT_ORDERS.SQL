
/* ===========================================
   VALIDACIÓN D – TABLA TXT_Orders
   Objetivo: verificar que los datos de TXT_Orders
   pueden convertirse a TMP_Orders sin romper
   (tipos de datos y campos obligatorios).
   =========================================== */

/* 0) Vista rápida: cuántos registros hay en TXT_Orders */
SELECT COUNT(*) AS total_registros
FROM TXT_Orders;

/* ===========================================
   1) order_id – será INTEGER y PK en TMP_Orders
   Reglas:
   - No puede ser nulo ni vacío
   - Tiene que ser numérico (sólo dígitos)
   =========================================== */

SELECT orderID, *
FROM TXT_Orders
WHERE 
    orderID IS NULL
 OR TRIM(orderID) = ''
 OR orderID NOT GLOB '[0-9]*';



/* ===========================================
   2) employee_id – será INTEGER en TMP_Orders
   Reglas:
   - Puede ser nulo (si el modelo lo permite)
   - Si viene informado, debe ser numérico
   =========================================== */

SELECT orderID, employeeID
FROM TXT_Orders
WHERE employeeID IS NOT NULL
  AND TRIM(employeeID) <> ''
  AND employeeID NOT GLOB '[0-9]*';


/* ===========================================
   3) ship_via – será INTEGER en TMP_Orders
   Reglas:
   - Igual criterio que employee_id
   =========================================== */

SELECT orderID, shipVia
FROM TXT_Orders
WHERE shipVia IS NOT NULL
  AND TRIM(shipVia) <> ''
  AND shipVia NOT GLOB '[0-9]*';


/* ===========================================
   4) freight – será REAL (decimal) en TMP_Orders
   Reglas:
   - Si viene informado, debe ser número (entero o con punto)
   =========================================== */

SELECT orderID, freight
FROM TXT_Orders
WHERE freight IS NOT NULL
  AND TRIM(freight) <> ''
  AND freight NOT GLOB '[0-9]*'
  AND freight NOT GLOB '[0-9]*.[0-9]*';


/* ===========================================
   5) Fechas: order_date, required_date, shipped_date
   Asumimos formato destino: YYYY-MM-DD
   REGLA SIMPLE: texto de 10 caracteres: '____-__-__'
   =========================================== */

/* 5.a) order_date – supongamos que es obligatoria */
SELECT orderID, orderDate
FROM TXT_Orders
WHERE orderDate IS NULL
   OR TRIM(orderDate) = ''
   OR orderDate NOT LIKE '____-__-__';

/* 5.b) required_date – puede ser nula, pero si viene, tiene que tener formato fecha */
SELECT orderID, requiredDate
FROM TXT_Orders
WHERE requiredDate IS NOT NULL
  AND TRIM(requiredDate) <> ''
  AND requiredDate NOT LIKE '____-__-__';

/* 5.c) shipped_date – idem required_date */
SELECT orderID, shippedDate
FROM TXT_Orders
WHERE shippedDate IS NOT NULL
  AND TRIM(shippedDate) <> ''
  AND shippedDate NOT LIKE '____-__-__';


/* ===========================================
   6) Campos de texto que vas a definir NOT NULL en TMP
   (ejemplo: ship_name, ship_address, ship_city, ship_country)
   =========================================== */

/* ship_name obligatorio */
SELECT orderID, shipName
FROM TXT_Orders
WHERE shipName IS NULL
   OR TRIM(shipName) = '';

/* ship_address obligatorio */
SELECT orderID, shipAddress
FROM TXT_Orders
WHERE shipAddress IS NULL
   OR TRIM(shipAddress) = '';

/* ship_city obligatorio */
SELECT orderID, shipCity
FROM TXT_Orders
WHERE shipCity IS NULL
   OR TRIM(shipCity) = '';

/* ship_country obligatorio */
SELECT orderID, shipCountry
FROM TXT_Orders
WHERE shipCountry IS NULL
   OR TRIM(shipCountry) = '';


INSERT INTO LOG_Ejecucion (
    script_name,
    start_time,
    end_time,
    status,
    rows_affec,
    message
)
VALUES (
    'Validar Formatos TXT_ORDERS.sql',
    datetime('now','-60 seconds'),   -- o reemplazalo por una variable si tenés
    datetime('now'),
    'SUCCESS',
    0,
    'No se encontraron inconsistencias de los tipos de datos'
);











































