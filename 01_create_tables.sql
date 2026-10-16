CREATE DATABASE MovieRevenueAnalysis;


USE MovieRevenueAnalysis;
GO

CREATE TABLE dbo.movies (
    budget BIGINT,
    genres NVARCHAR(MAX),
    homepage NVARCHAR(1000),
    id INT PRIMARY KEY,
    original_language NVARCHAR(20),
    popularity FLOAT,
    release_date NVARCHAR(30),
    revenue BIGINT,
    title NVARCHAR(500),
    vote_average FLOAT,
    vote_count INT
);

SELECT * FROM dbo.movies;