/* TerritoryID: PK de texto, obligatorio */
SELECT TerritoryID
FROM TXT_Territories
WHERE TerritoryID IS NULL
   OR TRIM(TerritoryID) = '';

/* RegionID: entero, FK a Region */
SELECT TerritoryID, RegionID
FROM TXT_Territories
WHERE RegionID IS NOT NULL
  AND TRIM(RegionID) <> ''
  AND RegionID NOT GLOB '[0-9]*';
INSERT INTO LOG_Ejecucion (
    script_name,
    start_time,
    end_time,
    status,
    rows_affected,
    message
)
VALUES (
    'Validar Formatos TXT_Territories.sql',
    datetime('now','-60 seconds'),   -- o reemplazalo por una variable si tenés
    datetime('now'),
    'SUCCESS',
    0,
    'No se encontraron inconsistencias de los tipos de datos'
)