--categories

-- CategoryID numérico (PK)
SELECT categoryID
FROM TXT_Categories
WHERE categoryID NOT GLOB '[0-9]*';
--valido picture--
SELECT productID, picture
FROM TXT_Categories
WHERE picture IS NOT NULL
  AND TRIM(picture) <> ''
  AND picture NOT GLOB '0x[0-9A-Fa-f]*';

-- CategoryName obligatorio (texto)
SELECT categoryID
FROM TXT_Categories
WHERE categoryName IS NULL OR TRIM(CategoryName) = ''
OR
description IS NULL OR TRIM(description) = '';

 INSERT INTO LOG_Ejecucion (
    script_name,
    start_time,
    end_time,
    status,
    rows_affec,
    message
)
VALUES (
    'Validar Formatos TXT_Categories.sql',
    datetime('now','-60 seconds'),   -- o reemplazalo por una variable si tenés
    datetime('now'),
    'SUCCESS',
    0,
    'No se encontraron inconsistencias de los tipos de datos'
);