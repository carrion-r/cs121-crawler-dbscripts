# cs121-crawler-dbscripts
CS 121. Mysql scripts to do post-processing on crawled data. Hosted on aws. 

Tables:
term_frequencies
terms
webpages

mysql> DESCRIBE term_frequencies
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra  |
+---------+-------------+------+-----+---------+-------+
| termID  | int(11)     | NO  | PRI | NULL    |         |
| docID   | int(3)      | NO  | PRI | NULL    |         |
| tf      | int(3)      | NO  |     | NULL    |         |
| wt_f    | double      | YES |     | NULL    |         |
| tf_idf  | double      | YES |     | NULL    |         |
+---------+-------------+------+-----+---------+-------+
mysql>DESCRIBE terms;
+---------+-------------+------+-----+---------+--------------+
| Field   | Type        | Null | Key | Default | Extra        |
+---------+-------------+------+-----+---------+--------------+
|term_id  |int(11)      |NO    |PRI   |NULL    |auto_incement |
|term     |varchar(255) |NO    |UNI   |NULL    |              |
|idf      |double       |YES   |      |NULL    |              |
+---------+-------------+------+-----+---------+--------------+

mysql> DESCRIBE webpages;
+---------+-------------+------+-----+---------+--------------+
| Field   | Type        | Null | Key | Default | Extra        |
+---------+-------------+------+-----+---------+--------------+
|docID    |int(11)      |NO    |PRI   |NULL    |auto_incement |
|url      |varchar(255) |NO    |UNI   |NULL    |              |
|filename |varchar(255) |NO    |      |NULL    |              |
|page_data|longtext     |YES   |      |NULL    |              |
|data_terms|mediumtext  |YES   |      |NULL    |              |
|total_terms|int(5)     |Yes   |      |0       |              |
+---------+-------------+------+-----+---------+--------------+

Filename column can be deleted, was initially included because of what the first part of the assignment required
