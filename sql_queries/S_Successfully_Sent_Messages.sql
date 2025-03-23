with received_mess as (select count(*) as received
from facebook_messages_sent as fs
inner join facebook_messages_received as fr
on fs.message_id = fr.message_id),

sent_mess as (select count(*) as sent from facebook_messages_sent)

select received_mess.received/sent_mess.sent
from received_mess, sent_mess;

-- WITH counts AS (
--     SELECT 
--         (SELECT COUNT(*) FROM facebook_messages_sent) AS sent,
--         (SELECT COUNT(*) 
--          FROM facebook_messages_sent fs
--          INNER JOIN facebook_messages_received fr
--          ON fs.message_id = fr.message_id) AS received
-- )
-- SELECT ROUND(received / sent, 4) AS success_ratio
-- FROM counts;
