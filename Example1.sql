DROP TABLE IF EXISTS #Contact
GO
CREATE TABLE #Contact
(
  Id INT NOT NULL,
  Type VARCHAR(255) NOT NULL,
  Present CHAR(1) NOT NULL,
  PRIMARY KEY (Id, Type)
 );
 GO
 INSERT INTO #Contact
 (
   Id,
   Type,
   Present
 )
 VALUES
 (1,'Home','Y'),
 (1,'Email','N'),
 (1,'Mobile','N'),
 (2,'Home','N'),
 (2,'Email','Y'),
 (2,'Work','N'),
 (3,'Mobile','Y');
 SELECT C.Id,
 		MAX(CASE Type WHEN 'Home' THEN Present ELSE 'N' END) AS Home,
        MAX(CASE Type WHEN 'Email' THEN Present ELSE 'N' END) AS Email,
        MAX(CASE Type WHEN 'Mobile' THEN Present ELSE 'N' END) AS Mobile
 FROM #Contact AS C
 GROUP BY C.Id;
