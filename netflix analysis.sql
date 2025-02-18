create database netflix;
use netflix;
SELECT 
    *
FROM
    netflix;


#count of movies and tv shows
select type, count(*) as total_counts
from netflix
group by type;


#most common Genre
select listed_in, count(*) as count
from netflix
group by listed_in
order by count desc
limit 5;

# most common ratings
select rating , count(*) as total_count
from netflix
group by rating
order by total_count desc
limit 5;

#most popular actors
select cast, count(*) as appearance
from netflix
group by cast
order by appearance desc
limit 5;

# years with the most content released
SELECT 
    release_year, COUNT(*) AS Total_released
FROM
    netflix
GROUP BY release_year
ORDER BY Total_released DESC
LIMIT 5;

# most frequent genre on netflx
SELECT 
    listed_in, COUNT(*) AS genre_count
FROM
    netflix
GROUP BY listed_in
ORDER BY genre_count desc
LIMIT 5;

# top 5 most colaborating directors
SELECT 
    director, COUNT(*) AS total_count
FROM
    netflix
WHERE
    director != 'unknown'
GROUP BY director
ORDER BY total_count DESC
LIMIT 5;

# longest running tv shows 
SELECT 
    title, duration_numeric AS seasons
FROM
    netflix
WHERE
    type = 'TV Show'
ORDER BY seasons DESC
LIMIT 7;

# shortest and longest movies 
#lonngest
select title, duration_numeric as minutes
from netflix
where type = 'Movie'
order by minutes desc
limit 5;

#shortest
select title, duration_numeric as minutes
from netflix
where type = 'Movie'
order by minutes asc
limit 5;

#monthly trend of content addition

select
    monthname(date_added) as month,
    count(*) as total_added
from netflix
where date_added is not null
group by  month
order by  FIELD(month, 'january','febuary','march','april','may','june','july','august','september','octorber','november','december');