--03_commercial_analysis

-- Film Revenue & Commercial Performance Analysis
-- Exploring revenue, budgets, genres and release trends
-- to identify patterns in film performance.

SELECT *
FROM dbo.movies

--Which films generated the highest revenue?

SELECT TOP 10 
   title,
   revenue,
    budget,
    (revenue - budget) AS profit
FROM dbo.movies
ORDER BY revenue DESC;

--Does a higher budget correlate with higher revenue?
--Which films had the highest production budgets? 
SELECT TOP 10
    title,
    revenue,
    budget
FROM dbo.movies
WHERE budget > 0
ORDER BY budget DESC;

--Which films generated the most revenue relative to budget? 

SELECT TOP 10 
    title,
    revenue,
    budget,
    ROUND (
        CAST(revenue AS FLOAT) / budget,
        2
    ) AS revenue_to_budget_ratio
FROM dbo.movies
WHERE budget > 0 
 AND revenue > 0 
 ORDER BY revenue_to_budget_ratio DESC


 --Which genres have the highest average popularity? 
SELECT
    g.name AS genre,
    COUNT(*) AS number_of_movies,
    ROUND(AVG(m.popularity), 2) AS average_popularity
FROM dbo.movies AS m
CROSS APPLY OPENJSON(m.genres)
WITH (
    name NVARCHAR(100) '$.name'
) AS g
WHERE g.name IS NOT NULL
GROUP BY g.name
ORDER BY average_popularity DESC;


--Which genres generate the highest average revenue?
SELECT
    g.name AS genre,
    COUNT(*) AS number_of_movies,
    ROUND(AVG(CAST(m.revenue AS FLOAT)), 2) AS average_revenue
FROM dbo.movies AS m
CROSS APPLY OPENJSON(m.genres)
WITH (
    name NVARCHAR(100) '$.name'
) AS g
WHERE m.revenue > 0
GROUP BY g.name
ORDER BY average_revenue DESC;

--How has average film revenue changed over time? 

SELECT
    YEAR (TRY_CONVERT(DATE, release_date)) AS release_year,
    COUNT (*) AS number_of_movies,
    ROUND(AVG(CAST(revenue AS FLOAT)),2) AS average_revenue
FROM dbo.movies
WHERE revenue > 0 
GROUP BY YEAR (TRY_CONVERT(DATE, release_date))
ORDER BY release_year DESC;


--Do films audiences rate most highly also generate the most revenue?

SELECT TOP 10 
    title,
    vote_average,
    vote_count,
    revenue 
FROM dbo.movies
WHERE vote_count > 1000
ORDER BY vote_average DESC;

--Which lower budget films generated high box-office revenue?
SELECT
    title,
    budget,
    revenue,
    vote_average
FROM dbo.movies
WHERE budget > 0
    AND budget < 20000000
    AND revenue > 100000000
ORDER BY revenue DESC;

--Do highly rated films generate more revenue? 

SELECT 
   CASE 
     WHEN vote_average < 5 THEN 'Below 5'
     WHEN vote_average < 7 THEN '5 to 7'
     ELSE '7 and avove'
    END AS rating_category, 

    COUNT(*) AS number_of_movies,

   ROUND(AVG(CAST(revenue AS FLOAT)),2) AS average_revenue

FROM dbo.movies

WHERE revenue > 0
AND vote_count > 1000

GROUP BY 
    CASE 
      WHEN vote_average < 5 THEN 'Below 5'
      WHEN vote_average < 7 THEN '5 to 7'
      ELSE '7 and avove'
     END


 ORDER BY average_revenue DESC;    


--Total Revenue per Genre 

SELECT
    m.id AS movie_id,
    m.title,
    g.name AS genre,
    m.revenue,
    m.budget,
    m.vote_average
FROM dbo.movies AS m
CROSS APPLY OPENJSON(m.genres)
WITH (
    name NVARCHAR(100) '$.name'
) AS g
WHERE m.revenue > 0
  AND g.name IS NOT NULL;