CREATE TABLE temp ( sigan DATE );

select TO_CHAR(sigan,'yyyy-mm-dd') from temp;
select * from temp;
select * from temp  where sigan <= TO_DATE('04-03','yyyy-mm-dd');
INSERT INTO temp VALUES(TO_DATE('2019-06-08','yyyy-mm-dd'));
select * from temp where sigan <= TO_DATE('2019-06-03','yyyy-mm-dd');
select sysdate from dual where sysdate <= TO_DATE('06-03','mm-dd');
INSERT INTO temp VALUES(TO_DATE('2019-03-08','yyyy-mm-dd'));
SELECT *
FROM temp
WHERE EXTRACT(MONTH FROM sigan) >= 4;
SELECT TO_CHAR(TO_DATE('2023/07/02', 'YYYY/MM/DD'), 'D') AS DAY_OF_WEEK
FROM DUAL;
--1: 월요일 ~ 7:토요일