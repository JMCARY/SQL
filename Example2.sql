DROP TABLE IF EXISTS #Contact
GO
CREATE TABLE #Contact
(
  Adult VARCHAR(255) NOT NULL,
  Child INT NOT NULL,
  Gender CHAR(1) NOT NULL,
  PRIMARY KEY (Adult, Child)
 );
 GO
 INSERT INTO #Contact
 (
   Adult,
   Child,
   Gender
 )
 VALUES
 ('Bob',1,'F'),
 ('Mark',1,'M'),
 ('Mark',2,'F'),
 ('Greg',1,'M'),
 ('Greg',2,'M'),
 ('Greg',3,'F');
 SELECT *
 FROM #Contact AS C
 WHERE EXISTS (
   SELECT 1 
   FROM #Contact F 
   WHERE F.Adult=C.Adult 
     AND F.Gender = 'F' 
   GROUP BY F.Adult 
   HAVING COUNT(1)=1
   INTERSECT 
   SELECT 1 
   FROM #Contact M 
   WHERE M.Adult=C.Adult 
     AND M.Gender = 'M' 
   GROUP BY M.Adult 
   HAVING COUNT(1)=1
 );
