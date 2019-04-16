-- 10억 12분24초 49G
drop table t1;
create table t1 as
    select
        gs as idx,
        '테스트' || gs as test_string
    from
        generate_series(1,1000000000) as gs;
-- delete from t1 where idx > 10000000;
