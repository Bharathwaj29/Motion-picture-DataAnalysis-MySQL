use sakila;
/*Task1*/
select concat(first_name, ' ', last_name) as 'Full_name' from actor;

/*Task2*/
select first_name, count(*) as 'Count of names' from actor group by first_name;
select count(distinct first_name) from actor;
select distinct(first_name) from actor;

/*Task3*/
select last_name, count(*) as 'Count of last_name' from actor group by last_name;
select distinct(last_name) from actor;

/*Task4*/
select film_id, title, rating from film where rating='R';
select film_id, title, rating from film where rating!='R';
select film_id, title from film where rating='G';

/*Task5*/
select film_id, title, replacement_cost from film where replacement_cost<=11;
select film_id, title, replacement_cost from film where replacement_cost between 11 and 20;
select film_id, title, replacement_cost from film order by replacement_cost desc;

/*Task6*/
select title, count(actor_id) from 
film join film_actor on
film.film_id=film_actor.film_id
group by title 
order by count(actor_id) desc limit 3; 

/*Task7*/
select title from film where title like 'K%' or title like 'Q%';

/*Task8*/
select concat(first_name, ' ', last_name) as 'Actor Names' from actor
join film_actor on actor.actor_id=film_actor.actor_id
join film on film_actor.film_id=film.film_id
where title='AGENT TRUMAN';

/*Task9*/
select category.name, category.category_id, film.title from category
join film_category on category.category_id=film_category.category_id
join film on film_category.film_id=film.film_id
where category.name='Family';

/*Task10*/
select rating, max(rental_rate), min(rental_rate), avg(rental_rate) from film 
group by rating order by avg(rental_rate) desc;

select title, rental_duration from film order by rental_duration desc;

/*Task11*/
select category.name, avg(replacement_cost), avg(rental_rate), 
avg(replacement_cost) - avg(rental_rate)  AS 'Difference' from film
join film_category on film.film_id=film_category.film_id
join category on film_category.category_id=category.category_id
group by category.name
having Difference > 15;

/*Task12*/
select category.name, count(film.title) as 'Count of films' from category
join film_category on category.category_id=film_category.category_id
join film on film_category.film_id=film.film_id
group by category.name
having count(film.title)>70;

