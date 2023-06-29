--관광지 인기도순 정렬
SELECT SUM(JAN+FEB+MAR+APR+MAY+JUN+JUL+AUG+SEP+OCT+NOV+DEC) as total,no 
FROM tourist_spot_popularity GROUP BY NO ORDER BY total DESC;
--
SELECT * FROM tourist_spot_popularity WHERE NO =1638;
SELECT * FROM tourist_spot WHERE NO = 1638;
--마지막으로 입력한 행 조회
SELECT NO FROM lastnum;
SELECT * FROM tourist_spot WHERE no=7089;
--지역별 관광지 인기도순 정렬시작
SELECT * FROM (SELECT name,lat,lnt
FROM tourist_spot s JOIN (
SELECT SUM(JAN+FEB+MAR+APR+MAY+JUN+JUL+AUG+SEP+OCT+NOV+DEC) as total,no 
FROM tourist_spot_popularity GROUP BY NO) p
ON s.no=p.no WHERE region='경기' ORDER BY total desc) WHERE rownum <=5;

--지역별 인기도 총합 순위
SELECT s.region, SUM(p.total) AS total_sum
FROM tourist_spot s
JOIN (
  SELECT no, SUM(JAN+FEB+MAR+APR+MAY+JUN+JUL+AUG+SEP+OCT+NOV+DEC) as total
  FROM tourist_spot_popularity
  GROUP BY no
) p ON s.no = p.no
GROUP BY s.region
ORDER BY total_sum DESC;

select distinct region from tourist_spot;