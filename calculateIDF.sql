ALTER TABLE icsdb.terms ADD idf double;

CREATE TEMPORARY TABLE IDFT(
termID int(11) PRIMARY KEY,
documentCount bigint DEFAULT 0
);

INSERT INTO IDFT(termID,documentCount)
SELECT tft.termID,COUNT(DISTINCT tft.docID) AS documentCount
FROM icsdb.term_frequencies AS tft
GROUP BY tft.termID ASC;

#44535 is our total amount of documents
UPDATE icsdb.terms AS tm
INNER JOIN IDFT AS ft
ON (tm.term_id=ft.termID)
SET tm.idf=(log(44535/ft.documentCount)+1.0);

DROP TABLE IDFT;

SELECT * FROM icsdb.terms;