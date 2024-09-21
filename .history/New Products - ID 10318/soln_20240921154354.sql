select company_name, total_launch from (select company_name,cnt-lag(cnt) over(partition by company_name order by year) as total_launch from (select company_name,year,count(product_name) as cnt from car_launches
group by company_name,year) as sub_q) as sub_q_2 where total_launch is not null