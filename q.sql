DECLARE
    CURSOR C1 IS
    SELECT * FROM PROFESSOR;


    REC1 C1%ROWTYPE;

BEGIN

    OPEN C1;

    LOOP 
        FETCH C1 INTO REC1;
        DBMS_OUTPUT.PUT_LINE(REC1.NAME);
        EXIT WHEN C1%NOTFOUND;
    END LOOP;
    
END;
/
