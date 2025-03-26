select *, dense_rank() over (order by s_mesa desc) as rn
from (select id_guest, sum(n_messages) as s_mesa
from airbnb_contacts
group by id_guest) as message_couts
order by rn;
