-- CHANGED DATA TYPE FOR GROSS COLUMN FROM VARCHAR TO BIG INT
ALTER TABLE imdb_top 
MODIFY COLUMN Gross BIGINT;

-- DATA CLEANING
-- removing columns that are not needed for the analysis
SELECT series_title, Released_Year, Runtime, Genre, Director, Gross, IMDB_Rating, No_of_Votes
FROM imdb_top it
WHERE Gross IS NOT NULL;

-- COUNTING no gross values
SELECT COUNT(*) AS null_rows
FROM imdb_top it
WHERE gross IS NULL;


-- counting movies by Genre
SELECT COUNT(genre) AS movies_made_per_genre, Genre
FROM imdb_top it 
GROUP BY Genre;

-- top 10 highest Grossing Films
SELECT Series_Title, Genre, Released_Year, Gross
FROM imdb_top it 
ORDER BY Gross DESC 
LIMIT 10;

-- MOVIES RELEASED PER YEAR
SELECT COUNT(Released_Year) as movies_produced, Released_Year 
FROM imdb_top it 
GROUP BY Released_Year
ORDER BY Released_Year DESC ;

-- Movies Released per Genre
SELECT genre, COUNT(genre) AS movies_per_genre
FROM imdb_top it 
GROUP BY genre
ORDER BY COUNT(Genre) DESC;

-- HIGHEST RATING MOVIES ACCORDING TO IMDB RATINGS
SELECT Series_Title, Genre, IMDB_Rating, Gross 
FROM imdb_top it 
WHERE Gross IS NOT NULL
ORDER BY IMDB_Rating DESC 
LIMIT 10;

-- sum of gross per genre
SELECT genre, SUM(gross) AS gross_genre
FROM imdb_top it 
WHERE Gross IS NOT NULL
GROUP BY Genre
ORDER BY gross_genre DESC;
















