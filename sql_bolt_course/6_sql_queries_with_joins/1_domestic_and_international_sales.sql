SELECT id, domestic_sales, international_sales 
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id;