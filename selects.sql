-- 1 По номеру зачетки найти студента найти посещаемость в разрезе дисциплин
SELECT S.NUM_Z, D.NAME DISP_NAME
FROM STUDENTS S JOIN ATTENDANCE A ON S.ID = A.STUDENT_ID
JOIN DISCIPLINES_PROFESSORS DP ON A.DISC_PROF_ID = DP.ID
JOIN DISCIPLINES D ON DP.DISCIPLINE_ID = D.ID
WHERE NUM_Z = 109208
GROUP BY S.NUM_Z,D.NAME
ORDER BY DISP_NAME

-- 3 Разделение по профессорам какие дисциплины есть
SELECT pr.NAME prof_name, pr.LAST_NAME prof_last_name, disc.NAME disc_name
from PROFESSOR pr
join DISCIPLINES_PROFESSORS dp on pr.id = dp.PROFESSOR_ID
join DISCIPLINES disc on dp.DISCIPLINE_ID = disc.ID
order by pr.NAME
