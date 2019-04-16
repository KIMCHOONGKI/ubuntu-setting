drop table t0;
create table t0 as select gs as idx, '테스트' || gs as test_string from generate_series(1,10000000) as gs;

drop table t1;
create table t1 (idx integer, test_string text, primary key (idx));
insert into t1 select * from t0;

drop table t2;
create table t2 (idx integer, test_string text, primary key (idx));
insert into t2 select * from t0;
create index idx2 on t2(test_string); -- Time: 98.392 s
