SELECT 'bull' AS word,
       SUM((LENGTH(LOWER(CONTENTS)) - 
            LENGTH(REPLACE(LOWER(CONTENTS), 
                           ' bull ', ''))) / 
           LENGTH(' bull ')) AS nentry
FROM google_file_store
UNION ALL
SELECT 'bear' AS word,
       SUM((LENGTH(LOWER(CONTENTS)) - 
            LENGTH(REPLACE(LOWER(CONTENTS), 
                           ' bear ', ''))) / 
           LENGTH(' bear ')) AS nentry
FROM google_file_store;
