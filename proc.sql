-- Добавление существующего препода и дисциплины
CREATE OR REPLACE PROCEDURE INSERT_PROF 
    (PROF_NAME IN VARCHAR2, PROF_LAST_NAME IN VARCHAR2, DISC_NAME IN VARCHAR2)
    IS
    PROF_ID NUMBER;
    DISC_ID NUMBER;

    CURSOR P1 IS
    SELECT PR.ID FROM PROFESSOR PR
    WHERE PR.NAME LIKE PROF_NAME AND PR.LAST_NAME LIKE PROF_LAST_NAME;

    CURSOR D1 IS
    SELECT DISC.ID FROM DISCIPLINES DISC
    WHERE DISC.NAME LIKE DISC_NAME;

BEGIN
    OPEN P1;
    FETCH P1 INTO PROF_ID;
    -- Надо сделать проверку, что он не пустой
    OPEN D1;
    FETCH D1 INTO DISC_ID;

    INSERT INTO DISCIPLINES_PROFESSORS (DISCIPLINE_ID, PROFESSOR_ID)
    VALUES(DISC_ID, PROF_ID);

END;
/
EXEC INSERT_PROF('Vladimir', 'Solovyev', 'ИССАПР');


-- Удаление связки профессора-дисциплины
CREATE OR REPLACE PROCEDURE DELETE_PROF
    (PROF_NAME IN VARCHAR2, PROF_LAST_NAME IN VARCHAR2, DISC_NAME IN VARCHAR2)
    IS
    PROF_ID NUMBER;
    DISC_ID NUMBER;

    CURSOR P1 IS
    SELECT PR.ID FROM PROFESSOR PR
    WHERE PR.NAME LIKE PROF_NAME AND PR.LAST_NAME LIKE PROF_LAST_NAME;

    CURSOR D1 IS
    SELECT DISC.ID FROM DISCIPLINES DISC
    WHERE DISC.NAME LIKE DISC_NAME;

BEGIN
    OPEN P1;
    FETCH P1 INTO PROF_ID;
    -- Надо сделать проверку, что он не пустой
    OPEN D1;
    FETCH D1 INTO DISC_ID;

    DELETE FROM DISCIPLINES_PROFESSORS DP 
    WHERE DP.DISCIPLINE_ID = DISC_ID AND DP.PROFESSOR_ID = PROF_ID;

END;
/

EXECUTE DELETE_PROF('Vladimir', 'Solovyev', 'ИССАПР');


