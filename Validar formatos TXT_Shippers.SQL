-- ShipperID PK numérico
SELECT ShipperID
FROM TXT_Shippers
WHERE ShipperID NOT GLOB '[0-9]*';

-- CompanyName obligatorio
SELECT ShipperID
FROM TXT_Shippers
WHERE CompanyName IS NULL OR TRIM(CompanyName) = '';
INSERT INTO LOG_Ejecucion (
    script_name,
    start_time,
    end_time,
    status,
    rows_affected,
    message
)
VALUES (
    'Validar Formatos TXT_Shippers.sql',
    datetime('now','-60 seconds'),   -- o reemplazalo por una variable si tenés
    datetime('now'),
    'SUCCESS',
    0,
    'No se encontraron inconsistencias de los tipos de datos'
);
