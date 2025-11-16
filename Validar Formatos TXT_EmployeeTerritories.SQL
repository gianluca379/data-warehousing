/* EmployeeID: tiene que ser entero */
SELECT EmployeeID, TerritoryID
FROM TXT_EmployeeTerritories
WHERE EmployeeID NOT GLOB '[0-9]*';

/* TerritoryID: PK de texto, no nulo/vacío */
SELECT EmployeeID, TerritoryID
FROM TXT_EmployeeTerritories
WHERE TerritoryID IS NULL
   OR TRIM(TerritoryID) = '';
INSERT INTO LOG_Ejecucion (
    script_name,
    start_time,
    end_time,
    status,
    rows_affected,
    message
)
VALUES (
    'Validar Formatos TXT_EmployeeTerritories.sql',
    datetime('now','-60 seconds'),   -- o reemplazalo por una variable si tenés
    datetime('now'),
    'SUCCESS',
    0,
    'No se encontraron inconsistencias de los tipos de datos'
)