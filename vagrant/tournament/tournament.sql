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
