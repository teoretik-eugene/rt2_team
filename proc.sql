create or replace procedure insert_prof 
    (prof_name in varchar2, prof_last_name in varchar2, disc_name in varchar2)
    is
    prof_id number;
    disc_id number;

    cursor p1 is
    select pr.id from PROFESSOR pr
    where pr.name like prof_name and pr.last_name like prof_last_name;

    cursor d1 is
    select disc.id from DISCIPLINES disc
    where disc.name like disc_name;

BEGIN
    open p1;
    FETCH p1 INTO prof_id;
    -- Надо сделать проверку, что он не пустой
    open d1;
    FETCH d1 INTO disc_id;

    INSERT INTO DISCIPLINES_PROFESSORS (DISCIPLINE_ID, PROFESSOR_ID)
    values(prof_id, disc_id);

END;
/
EXECUTE INSERT_PROF('Vladimir', 'Solovyev', 'ИССАПР');



