SELECT title , (domestic_sales + international_sales) / 1000000 as combined_sales
FROM movies
JOIN boxoffice
ON movies.id = boxoffice.movie_id;