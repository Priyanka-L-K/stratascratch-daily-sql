select count(distinct customer_id) as num_of_cstmrs,count(*) as num_of_trnsctns 
from wfm_transactions
where year(transaction_date) = 2017 and sales >= 5;
