--Data exploration 

SELECT * FROM dbo.movies;

--How many total movies are in my dataset?
SELECT COUNT(*) AS TotalMovies FROM dbo.movies;
--4803 movies 


--Are any film IDs duplicated?
SELECT 
id,
COUNT(*) AS occurrences
FROM dbo.movies
GROUP BY id
HAVING COUNT(*) > 1;

--What are all the different movie genres in my dataset?
SELECT DISTINCT
    g.name AS genre
FROM dbo.movies AS m 
CROSS APPLY OPENJSON(m.genres)
WITH(
    name NVARCHAR(100) '$.name'
) AS g;


