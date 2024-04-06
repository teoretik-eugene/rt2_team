CREATE or replace procedure addProfessorDisc
        (prof_name in varchar2, prof_last_name in varchar2, disc_name in varchar2)
        is
        cursor p1 is
        select *
        from PROFESSOR p
        where p.NAME = prof_name and p.LAST_NAME = prof_last

        cursor p2 is
        select *
        from disciplines disc
        where disc.NAME = disc_name

-- не закончено
