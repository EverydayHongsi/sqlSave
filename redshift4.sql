explain
select data, sum(usage_count)
where rental_place_num = '324'
group by date
order by date;

-- 리더노드가 어떤 방식으로 진행되는지 쿼리를 설명함.
-- from과 where 절이 있을 때만 사용가능.
--쿼리 플래닝. 튜닝해서 속도를 바꿀 수 있음.

--