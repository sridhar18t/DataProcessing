create table query1 as (
select  name , count(genres.genreid) as moviecount
from genres,hasagenre 
where  hasagenre.genreid = genres.genreid
group by genres.genreid);

create table query2 as (
select  name , avg(ratings.rating) 
from genres,hasagenre ,ratings
where  hasagenre.genreid = genres.genreid and hasagenre.movieid = ratings.movieid
group by genres.genreid);

create table query3 as(
select movies.title, count(rating) as countofratings
from movies, ratings
where ratings.movieid = movies.movieid 
group by movies.movieid 
having count(rating) >= 10);

create table query4 as (
select  movies.movieid , movies.title 
from genres,hasagenre, movies
where  hasagenre.genreid = genres.genreid and hasagenre.movieid = movies.movieid
 and genres.name = 'Comedy');

create table query5 as (
select movies.title , avg(ratings.rating) as average  
from movies, ratings
where movies.movieid = ratings.movieid 
group by movies.title);

create table query6 as(
select avg(rating) as average
from hasagenre, ratings ,genres
where hasagenre.movieid = ratings.movieid
 and hasagenre.genreid = genres.genreid 
and genres.name = 'Comedy');

create table query7 as (	
select avg(rating) as average
from hasagenre h1, hasagenre h2, ratings ,genres g1, genres g2
where h1.movieid = ratings.movieid
	and h1.genreid = g1.genreid
	and h2.movieid = ratings.movieid
	and h2.genreid = g2.genreid
	and  (g1.name = 'Romance' and g2.name = 'Comedy'));

	  
create table query8 as (
select avg(r.rating) as average from ( select h1.movieid
from hasagenre h1, hasagenre h2, ratings ,genres g1, genres g2
where h1.movieid = ratings.movieid
	and h1.genreid = g1.genreid
	and h2.movieid = ratings.movieid
	and h2.genreid = g2.genreid
	and g1.name = 'Romance' 
except 	
		  select h1.movieid 
from  hasagenre h1, hasagenre h2, ratings r ,genres g1, genres g2
where h1.movieid = r.movieid
	and h1.genreid = g1.genreid
	and h2.movieid = r.movieid
	and h2.genreid = g2.genreid
	and   g2.name = 'Comedy') s inner join ratings r on s.movieid= r.movieid);
	  	  	

Create table query9 as (
select movieid ,rating
from ratings, users
where users.userid = ratings.userid and users.userid = :v1);
