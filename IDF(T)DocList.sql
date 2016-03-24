SELECT termID,
	group_concat(docID separator ',') AS "doclist", COUNT(*), 1+ln(44535/COUNT(*)) AS 'IDF(T)'
FROM icsdb.term_frequencies group by termID ASC;

