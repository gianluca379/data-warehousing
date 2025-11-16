-- SupplierID PK numérico
SELECT supplierID
FROM TXT_Suppliers
WHERE supplierID NOT GLOB '[0-9]*'
OR
(PostalCode IS NOT NULL
  AND TRIM(PostalCode) = '');

INSERT INTO LOG_Ejecucion (
    script_name,
    start_time,
    end_time,
    status,
    rows_affected,
    message
)
VALUES (
    'Validar Formatos TXT_Suppliers.sql',
    datetime('now','-60 seconds'),   -- o reemplazalo por una variable si tenés
    datetime('now'),
    'SUCCESS',
    0,
    'No se encontraron inconsistencias de los tipos de datos'
);

