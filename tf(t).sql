/*
Add weighted tf
*/

ALTER TABLE icsdb.term_frequencies ADD wt_f double;


CREATE TEMPORARY TABLE WFT(
termID int(11),
docID int(3),
wt_f double DEFAULT 0,
PRIMARY KEY(termID,docID)
);


INSERT INTO WFT(termID,docID,wt_f)
SELECT  tft.termID,tft.docID,tft.tf/wb.total_terms AS wt_f
FROM icsdb.term_frequencies AS tft,icsdb.webpages AS wb
WHERE tft.docID=wb.docID;


UPDATE icsdb.term_frequencies AS tf
INNER JOIN WFT AS wt
ON (tf.termID=wt.termID)
SET tf.wt_f=wt.wt_f
WHERE(tf.docID=wt.docID);


-- SELECT * FROM icsdb.term_frequencies AS tf 
-- INNER JOIN WFT AS wf ON (tf.termId=wf.termID) 
-- WHERE tf.docID=1 AND wf.docID=1;


-- SELECT termID, icsdb.term_frequencies.docID,tf,total_terms,tf/total_terms AS 'Normalized TF(t)'
-- FROM icsdb.term_frequencies, icsdb.webpages
-- WHERE icsdb.term_frequencies.docID=icsdb.webpages.docID;