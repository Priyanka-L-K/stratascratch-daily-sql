select count(*)
from facebook_reactions as fr
inner join facebook_posts as fp
on fr.post_id = fp.post_id
where fr.reaction = 'like';
