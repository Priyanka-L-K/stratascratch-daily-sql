-- can use multiple columns inside window function's order by

select from_user, count(*) as tots, row_number() over (order by count(*) desc, from_user asc) as rn
from google_gmail_emails
group by from_user;
