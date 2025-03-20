select sum(case when host_identity_verified = 1 then 1 else 0 end) as verified_cn, sum(case when host_identity_verified = 0 then 1 else 0 end) as unverified_cn
from airbnb_search_details;
