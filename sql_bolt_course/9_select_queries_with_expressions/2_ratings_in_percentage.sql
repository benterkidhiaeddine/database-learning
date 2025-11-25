SELECT title , round(rating * 100 / 10) as combined_sales
FROM movies
JOIN boxoffice
ON movies.id = boxoffice.movie_id;