/*Part 2: Simple Selects and Counts
What are all the types of pokemon that a pokemon can have?
What is the name of the pokemon with id 45?
How many pokemon are there?
How many types are there?
How many pokemon have a secondary type?*/

--What are all the types of pokemon that a pokemon can have?
SELECT COUNT(*) FROM types;
#-18


--What is the name of the pokemon with id 45?
SELECT name FROM Pokemon
WHERE id = 45;
#-Eevee


--How many pokemon are there?
SELECT COUNT(*) FROM pokemons;
--656


--How many types are there?
SELECT COUNT(DISTINCT(primary_type)) FROM pokemons;
--18


--How many pokemon have a secondary type?
SELECT COUNT(secondary_type) FROM pokemons
WHERE secondary_type IS NOT NULL;