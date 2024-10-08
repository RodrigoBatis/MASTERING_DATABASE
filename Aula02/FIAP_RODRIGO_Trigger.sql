create or replace TRIGGER TAI_EMPlOYEES
AFTER INSERT ON EMPLOYEES
FOR EACH ROW

BEGIN

 insert into ACCOUNTS (USERNAME, PASSWORD, STATUS)
 VALUES (:NEW.FIRST_NAME || '.' || :NEW.LAST_NAME,
 fn_password_mascarade('A'),
 1);

END;

SHOW ERRORS;

-- TESTANDO
SELECT * FROM ACCOUNTS WHERE USERNAME = 'JOSE.SILVA';

INSERT INTO EMPLOYEES( EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, 
JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
VALUES
  (
    EMPLOYEES_SEQ.NEXTVAL,
    'JOSE',
    'SILVA',
    'jose.silva@empresa.com',
    '1140034003',
    SYSDATE,
    'FI_ACCOUNT',
    2000,
    0,
    108,
    100
  );

COMMIT;

SELECT * FROM ACCOUNTS WHERE USERNAME = 'JOSE.SILVA';


CREATE OR REPLACE TRIGGER TBD_EMPLOYEES
BEFORE DELETE ON EMPLOYEES 
FOR EACH ROW

BEGIN 
    UPDATE ACCOUNTS SET STATUS = 0
    WHERE USERNAME =: OLD.FIRST_NAME || '.' || :OLD.LAST_NAME;
END;

SELECT * FROM ACCOUNTS WHERE USERNAME = 'JOSE.SILVA';

COMMIT;