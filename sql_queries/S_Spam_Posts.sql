with all_viewed_posts as (select fp.post_date, count(*) as all_view_posts
from facebook_posts as fp
inner join facebook_post_views as fpv
on fp.post_id = fpv.post_id
group by post_date),
viewed_spam_posts as (select fp.post_date, count(*) as all_view_spam_posts
from facebook_posts as fp
inner join facebook_post_views as fpv
on fp.post_id = fpv.post_id
where fp.post_keywords regexp '.*spam.*'
group by fp.post_date)

select avp.post_date, (vsp.all_view_spam_posts/avp.all_view_posts) * 100 as spam_share
from viewed_spam_posts as vsp
inner join all_viewed_posts as avp
group by post_date;
