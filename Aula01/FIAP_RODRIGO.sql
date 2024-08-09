Select * from user_Objects;
Select * from All_Objects;
Select * From dictionary;
Select * from ALL_TAB_PRIVS;

DECLARE
    VCONTADOR INT;
    E_VAI_DE_B EXCEPTION;
--    PRAGMA EXCEPTION_INIT (E_VAI_DE_B, -0001);
BEGIN
    VCONTADOR := 0;
    FOR REGISTRO IN (Select 1 UM
    FROM dual where 1=2) LOOP
    VCONTADOR := REGISTRO.UM;
    END LOOP;
    
    IF VCONTADOR = 0 THEN
        RAISE E_VAI_DE_B;
    END IF;
    
EXCEPTION 
    WHEN E_VAI_DE_B THEN
    VCONTADOR := 2;
        
END;