/*
 Directions: Write a query that returns the following collumns:

Pokemon Name	Trainer Name	Level	Primary Type	Secondary Type
Pokemon's name	Trainer's name	Current Level	Primary Type Name	Secondary Type Name

Sort the data by finding out which trainer has the strongest pokemon so that this will act
 as a ranking of strongest to weakest trainer. You may interpret strongest in whatever way
 you want, but you will have to explain your decision.
 */

SELECT p.name AS 'Pokemon Name',
t.trainername AS 'Trainer Name',
pt.pokelevel 'Level', ty.name AS 'Primary Type', typ.name
FROM pokemons AS p, trainers AS t , pokemon_trainer AS pt , types AS ty, types AS typ
WHERE p.id = pt.pokemon_id AND t.trainerID = pt.trainerID
AND ty.id=p.primary_type AND typ.id = p.secondary_type
ORDER BY pt.pokelevel DESC, pt.attack DESC, pt.hp DESC

/*
Based on the result, the strongest pokemon is Rayquaza, level 100, primary type is
Dragon, in the pokemon series, Dragon is the strongest type in this game. */



