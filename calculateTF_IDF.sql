ALTER TABLE icsdb.term_frequencies ADD tf_idf double;


UPDATE icsdb.term_frequencies AS tft
INNER JOIN icsdb.terms AS tmt
ON (tft.termID=tmt.term_id)
SET tft.tf_idf=tft.wt_f*tmt.idf;

-- INSERT INTO icsdb.term_frequencies(tf_idf)
-- SELECT tft.wt_f*tms.idf AS tf_idf
-- FROM icsdb.term_frequencies AS tft, icsdb.terms AS tms
-- WHERE tft.termID=tms.term_id;