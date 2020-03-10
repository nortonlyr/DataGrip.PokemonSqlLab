/*
Part 3: Joins and Groups
Directions: Write a sql query or sql queries that can answer the following questions

What is each pokemon's primary type?
What is Rufflet's secondary type?
What are the names of the pokemon that belong to the trainer with trainerID 303?
How many pokemon have a secondary type Poison
What are all the primary types and how many pokemon have that type?
How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? 
(Hint: your query should not display a trainer
How many pokemon only belong to one trainer and no other?
*/

-- What is each pokemon's primary type?

SELECT p.id AS pokemon_id, p.name AS pokemon_name, p.primary_type, t.name AS type_name
FROM pokemon AS p, types AS t
WHERE p.primary_type = t.id;

--Show a table with 500 (id) pokemon's primary type, pokemon_name, 
--pokemon_name and type_name


-- What is Rufflet's secondary type?

SELECT p.id AS pokemon_id, p.name AS pokemon_name, p.secondary_type, t.name AS type_name
FROM pokemons AS p, types AS t
WHERE p.secondary_type = t.id
AND p.name = 'Rufflet';

-- 644 Rufflet, 18 Flying


--What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT p.id AS pokemon_id, p.name AS pokemon_name, pt.trainerID, trainers.trainername
FROM pokemons AS p, types AS t, pokemon_trainer AS pt, trainers
WHERE p.id = pt.pokemon_id
AND pt.trainerID = trainers.trainerID
AND pt.trainerID = 303;

-- 2 Wailord	303	Ace Duo Elina & Sean
-- 3 Vileplume	303	Ace Duo Elina & Sean



--How many pokemon have a secondary type Poison?
SELECT t.name as type_name, count(p.secondary_type)
FROM pokemons as p, types as t
WHERE p.secondary_type = t.id
AND t.name = 'Poison';

-- 31

--What are all the primary types and how many pokemon have that type?
SELECT p.primary_type, t.name as type_name, count(*)
FROM pokemons AS p, types as t
WHERE p.primary_type = t.id
GROUP BY p.primary_type;

/*
1	Normal	    90
2	Water	    95
3	Grass	    59
4	Rock	    38
5	Fire	    38
6	Ground	    29
7	Poison	    27
8	Bug	        61
9	Electric	35
10	Dragon	    22
11	Steel	    19
12	Dark	    24
13	Fighting	25
14	Psychic	    38
15	Ghost	    19
16	Fairy	    14
17	Ice	        22
18	Flying	     1
 */


--How many pokemon at level 100 does each trainer with at least one level 100 pokemone have? 
--(Hint: your query should not display a trainer)
SELECT pt.trainerID, count(*)
FROM pokemon_trainer AS pt, trainers as tr
WHERE pt.trainerID = tr.trainerID
AND pt.pokelevel >= 100
GROUP BY pt.trainerID;


--How many pokemon only belong to one trainer and no other?
SELECT pokemon_id, count(trainerID)
FROM pokemon_trainer
GROUP BY pokemon_id
ORDER BY count(trainerID);