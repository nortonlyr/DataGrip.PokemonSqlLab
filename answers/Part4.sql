/*
 Directions: Write a query that returns the following collumns:

Pokemon Name	Trainer Name	Level	Primary Type	Secondary Type
Pokemon's name	Trainer's name	Current Level	Primary Type Name	Secondary Type Name

Sort the data by finding out which trainer has the strongest pokemon so that this will act
 as a ranking of strongest to weakest trainer. You may interpret strongest in whatever way
 you want, but you will have to explain your decision.
 */

SELECT p.id, p.name AS Pokemon_Name,
       tr.trainername AS Trainer_Name,
       pt.pokelevel AS PokeLevel,
       p.primary_type as Primary_Type,
       ty.name AS Type_Name,
       p.secondary_type as Secondary_Type,
       ty2.name AS Type_Name,
       SUM(pokelevel) OVER(PARTITION BY p.name) as total_levels

FROM pokemons AS p, trainers AS tr, types AS ty, pokemon_trainer AS pt
ORDER BY p.id;




