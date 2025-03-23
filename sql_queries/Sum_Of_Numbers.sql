(select sum(number)
from transportation_numbers
where `index` < 5)

union all

(select sum(number)
from transportation_numbers
where `index` > 5);
