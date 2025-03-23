select ei.product_name, count(*)
from excel_sql_inventory_data as ei
inner join excel_sql_transaction_data as et
on ei.product_id = et.product_id
group by ei.product_id, ei.product_name
order by ei.product_id asc;
