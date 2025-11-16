/* EmployeeID: PK, entero, obligatorio */
SELECT EmployeeID
FROM TXT_Employees
WHERE EmployeeID IS NULL
   OR TRIM(EmployeeID) = ''
   OR EmployeeID NOT GLOB '[0-9]*';

/* BirthDate: debe poder convertirse a DATE */
SELECT EmployeeID, BirthDate
FROM TXT_Employees
WHERE BirthDate IS NOT NULL
  AND TRIM(BirthDate) <> ''
  AND date(BirthDate) IS NULL;

/* HireDate: debe poder convertirse a DATE */
SELECT EmployeeID, HireDate
FROM TXT_Employees
WHERE HireDate IS NOT NULL
  AND TRIM(HireDate) <> ''
  AND date(HireDate) IS NULL;

/* ReportsTo: entero si viene informado */
SELECT EmployeeID, ReportsTo
FROM TXT_Employees
WHERE ReportsTo IS NOT NULL
  AND TRIM(ReportsTo) <> ''
  AND ReportsTo NOT GLOB '[0-9]*';

/* Photo: si viene algo, que tenga formato hex tipo 0xFF… (como en Products) */
SELECT EmployeeID, Photo
FROM TXT_Employees
WHERE Photo IS NOT NULL
  AND TRIM(Photo) <> ''
  AND Photo NOT GLOB '0x[0-9A-Fa-f]*';


INSERT INTO LOG_Ejecucion (
    script_name,
    start_time,
    end_time,
    status,
    rows_affected,
    message
)
VALUES (
    'Validar Formatos TXT_Employees.sql',
    datetime('now','-60 seconds'),   -- o reemplazalo por una variable si tenés
    datetime('now'),
    'SUCCESS',
    1,
    'Se detectaron valores no convertibles en ReportsTo:  fila con employee id=2 tiene un 'NULL' textual.'
);

