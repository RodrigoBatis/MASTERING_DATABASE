DROP TABLE CAMPOS_ANONIMOS;

-- TABELA DE REFERENCIA
CREATE TABLE CAMPOS_ANONIMOS(
    TABELA  VARCHAR2(30),
    CAMPO   VARCHAR2(30),
    TIPO    VARCHAR2(30)
);

/* Populando a tabela de referencia com metados da tabela employees*/
SELECT * FROM USER_TABLES;

INSERT INTO CAMPOS_ANONIMOS
SELECT  table_name,
        column_name,
        data_type
FROM USER_TAB_COLUMNS
WHERE table_name = 'EMPLOYEES'
AND column_name IN ('FIRST_NAME', 'LAST_NAME', 'EMAIL', 'PHONE_NUMBER');
