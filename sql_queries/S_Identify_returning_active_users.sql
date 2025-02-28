-- i had used timestampdiff but using datediff makes sense here, also when doing self join the condition i used which 
-- was not right is that a_t2.created_at > a_t1.created_at but they used id instead of created_at like a_t2.id <> a_t1.id

select distinct a_t1.user_id
from amazon_transactions as a_t1
join amazon_transactions as a_t2
on a_t1.user_id = a_t2.user_id 
and a_t2.id <> a_t1.id
and datediff(a_t2.created_at, a_t1.created_at) between 0 and 7
order by a_t1.user_id;
