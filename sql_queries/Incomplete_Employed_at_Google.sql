select * 
from linkedin_users
where employer = 'Google'  and DATE(start_date) = '2021-11-01' and count(*) > 2;
