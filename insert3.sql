-- 20억 26분 4초 98G
drop table t1;
create table t1 as
    select
        gs as idx,
        '테스트' || gs as test_string
    from
        generate_series(1,2000000000) as gs;
-- delete from t1 where idx > 10000000;
