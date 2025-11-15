CREATE TABLE LOG_Ejecucion (
    logID INTEGER PRIMARY KEY AUTOINCREMENT,
    script_name TEXT NOT NULL,
    start_time TEXT NOT NULL,
    end_time TEXT,
    status TEXT NOT NULL, 
    rows_affected INTEGER,
    message TEXT
);