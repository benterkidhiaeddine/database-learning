SELECT director, Count(Title) as movies_of_director 
FROM movies
GROUP BY director;