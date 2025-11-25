SELECT director, Sum(domestic_sales) +  Sum(international_sales) as total_sales
FROM movies
JOIN boxoffice 
ON movies.id = boxoffice.movie_id
GROUP BY director;