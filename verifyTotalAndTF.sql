SELECT *,LENGTH(data_terms) - LENGTH(REPLACE(data_terms,'\n','')) AS actualsize
FROM icsdb.webpages
WHERE ( (total_terms - (LENGTH(data_terms) - LENGTH(REPLACE(data_terms,'\n','')))) < 0 OR total_terms IS NULL);

/*
Verifies that there are not discrepancies between the amount in total_terms and the actual length of the data
Because we calculated total_terms based on the values recorded in term_frequencies table, this verifies that all terms 
were recorded and processed. 
*/

