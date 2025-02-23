select words1, words2, 
length(words1) - length(replace(words1, ',', '')) + 1 as words1cnt, 
length(words2) - length(replace(words2, ',', '')) + 1 as words2,
(length(words1) - length(replace(words1, ',', '')) + 1) + (length(words2) - length(replace(words2, ',', '')) + 1) as cntwordslist
from google_word_lists;
