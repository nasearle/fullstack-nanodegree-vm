## Tournament Results
This is a system for matching players in a Swiss Tournament and recording the results in a database.
	
### Included files:
* fullstack-nanodegree-vm
	* README.txt
	* vagrant
		* pg_config.sh and Vagrantfile - files necessary for Vagrant to work
		* .vagrant - more necessary Vagrant stuff
		* tournament - contains the relevant files of this project				
			* tournament.sql - sets up the database and tables to store the results of the tournament
			* tournament.py - contains the functions to enter data into and retrieve data from the database
			* tournament_test.py - contains a series of test functions to check if tournament.py is working
	
### Instructions:
First, fork the Project 2 - Tournament Results repository so 
that you have a version within your GitHub account. Clone your 
version of the Project 2 - Tournament Results repository to your
local machine.

Navigate to the tournament folder in the repository, open a 
GitBash there and enter the command $ vagrant up. When vagrant 
has finished starting up, enter the command $ vagrant ssh. Enter
$ cd /vagrant and then $ cd tournament.

To create the database to store the players and results of our
tournament, we need to use the psql command line interface. Enter
$ psql into GitBash, followed by \i tournament.sql. This will 
set up the database with players and matches tables. Enter $ \q
to exit the psql command line.

Enter $ python. You can now >>> import tournament and use the
functions in tournament.py to set up a Swiss tournament! Use 
registerPlayer(name) to enter players into the draw, and then
swissPairings() to match players. Enter the results after each game
using reportMatch(winner, loser) to update the standings. The 
players' standings can be seen using the playerStandings() 
function. After the first round of matches is complete, you can 
use swissPairings() again to set up the second round, and so on.

There is also a countPlayers() function which returns the number 
of players. Finally, there are deletePlayers() and deleteMatches()
functions, which allow you to remove all data to start a new
tournament!