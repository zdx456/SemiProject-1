--joindateChart 필요 테이블
create table temp_year(year number primary key);
insert into temp_year values(2022);
insert into temp_year values(2023);
insert into temp_year values(2024);
insert into temp_year values(2025);
insert into temp_year values(2026);
insert into temp_year values(2027);
insert into temp_year values(2028);
commit;

-- joindateChart 필요 뷰
create or replace view year_status as
select
    year, count(C.client_id) cnt 
from 
    temp_year T 
        left outer join client C 
            on T.year = extract(year from C.client_joindate)
        group by year;

--joindateChart 필요 테이블
create table temp_year_month(
 year number not null,
 month number not null,
 primary key(year, month) 
);
insert into temp_year_month values(2022, 1);
insert into temp_year_month values(2022, 2);
insert into temp_year_month values(2022, 3);
insert into temp_year_month values(2022, 4);
insert into temp_year_month values(2022, 5);
insert into temp_year_month values(2022, 6);
insert into temp_year_month values(2022, 7);
insert into temp_year_month values(2022, 8);
insert into temp_year_month values(2022, 9);
insert into temp_year_month values(2022, 10);
insert into temp_year_month values(2022, 11);
insert into temp_year_month values(2022, 12);
insert into temp_year_month values(2023, 1);
insert into temp_year_month values(2023, 2);
insert into temp_year_month values(2023, 3);
insert into temp_year_month values(2023, 4);
insert into temp_year_month values(2023, 5);
insert into temp_year_month values(2023, 6);
insert into temp_year_month values(2023, 7);
insert into temp_year_month values(2023, 8);
insert into temp_year_month values(2023, 9);
insert into temp_year_month values(2023, 10);
insert into temp_year_month values(2023, 11);
insert into temp_year_month values(2023, 12);
insert into temp_year_month values(2024, 1);
insert into temp_year_month values(2024, 2);
insert into temp_year_month values(2024, 3);
insert into temp_year_month values(2024, 4);
insert into temp_year_month values(2024, 5);
insert into temp_year_month values(2024, 6);
insert into temp_year_month values(2024, 7);
insert into temp_year_month values(2024, 8);
insert into temp_year_month values(2024, 9);
insert into temp_year_month values(2024, 10);
insert into temp_year_month values(2024, 11);
insert into temp_year_month values(2024, 12);
insert into temp_year_month values(2025, 1);
insert into temp_year_month values(2025, 2);
insert into temp_year_month values(2025, 3);
insert into temp_year_month values(2025, 4);
insert into temp_year_month values(2025, 5);
insert into temp_year_month values(2025, 6);
insert into temp_year_month values(2025, 7);
insert into temp_year_month values(2025, 8);
insert into temp_year_month values(2025, 9);
insert into temp_year_month values(2025, 10);
insert into temp_year_month values(2025, 11);
insert into temp_year_month values(2025, 12);
commit;