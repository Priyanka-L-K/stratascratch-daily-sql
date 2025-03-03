-- it looked so confusing but its so simple damn i didnt think of solving it like this at all

SELECT user_id, friend_id FROM google_friends_network
UNION
SELECT friend_id, user_id FROM google_friends_network;
