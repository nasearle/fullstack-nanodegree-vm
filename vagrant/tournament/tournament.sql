-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
--
-- This sql code starts by dropping the database if it exists, to remove the "This
-- database already exists" message. It then creates the database and connects
-- to it. The same is done with the tables, dropping the matches table first
-- because of its dependencies on the players table.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament;

DROP VIEW IF EXISTS standings;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS players;

CREATE TABLE players (
	id 		SERIAL PRIMARY KEY,
	name	text
);

CREATE TABLE matches (
	winner	integer references players(id),
	loser	integer references players(id)
);

CREATE VIEW standings AS 
	select id, name, coalesce(wins, 0) as wins, coalesce(losses, 0)
			+ coalesce(wins, 0) as matches 
	from players left join (select winner, count(*) as wins from matches
		group by winner) as allwins on players.id = allwins.winner left join
        (select loser, count(*) as losses from matches group by loser)
        as alllosses on players.id = alllosses.loser
    order by wins desc;