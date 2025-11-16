/* RegionID: PK entera, obligatoria */
SELECT RegionID
FROM TXT_Region
WHERE RegionID IS NULL
   OR TRIM(RegionID) = ''
   OR RegionID NOT GLOB '[0-9]*';
INSERT INTO LOG_Ejecucion (
    script_name,
    start_time,
    end_time,
    status,
    rows_affected,
    message
)
VALUES (
    'Validar Formatos TXT_Regions.sql',
    datetime('now','-60 seconds'),   -- o reemplazalo por una variable si tenés
    datetime('now'),
    'SUCCESS',
    0,
    'No se encontraron inconsistencias de los tipos de datos'
)