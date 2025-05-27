WITH max_date AS
  (SELECT user_id,
          account_id,
          MAX(record_date) AS max_date
   FROM sf_events
   GROUP BY user_id,
            account_id),
     dec_2020 AS
  (SELECT DISTINCT account_id,
                   user_id
   FROM sf_events
   WHERE DATE_FORMAT(record_date, '%Y-%m') = '2020-12'),
     jan_2021 AS
  (SELECT DISTINCT account_id,
                   user_id
   FROM sf_events
   WHERE DATE_FORMAT(record_date, '%Y-%m') = '2021-01'),
     retention_dec_2020 AS
  (SELECT d.account_id,
          SUM(CASE
                  WHEN m.max_date > '2020-12-31' THEN 1
                  ELSE 0
              END) / COUNT(*) AS retention_dec
   FROM dec_2020 d
   JOIN max_date m ON d.user_id = m.user_id
   AND d.account_id = m.account_id
   GROUP BY d.account_id),
     retention_jan_2021 AS
  (SELECT j.account_id,
          SUM(CASE
                  WHEN m.max_date > '2021-01-31' THEN 1
                  ELSE 0
              END) / COUNT(*) AS retention_jan
   FROM jan_2021 j
   JOIN max_date m ON j.user_id = m.user_id
   AND j.account_id = m.account_id
   GROUP BY j.account_id)
SELECT COALESCE(rd.account_id, rj.account_id) AS account_id,
       COALESCE(rj.retention_jan, 0) / COALESCE(rd.retention_dec, 1) AS retention
FROM retention_dec_2020 rd
LEFT JOIN retention_jan_2021 rj ON rd.account_id = rj.account_id;
