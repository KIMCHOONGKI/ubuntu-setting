-- 40억 64분 58초 225G
drop table t1;
create table t1 as
    select
        gs as idx,
        '테스트' || gs as test_string
    from
        generate_series(1,4000000000) as gs;
-- delete from t1 where idx > 10000000;
