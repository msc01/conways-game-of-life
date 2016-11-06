# Conway's Game of Life
Simple Ruby implementation of [Conway's game of life][1].

## Synopsis
    ./bin/conway

## Description
A simple implementation of [Conway's game of life][1] in Ruby developed during the [Global Day of Code Retreat][2] [2016 in Karlsruhe][3].

## ToDo
Bugs:

* Rule 4 is missing.

Things which need to be done in further version:

* Documentation.
* Seed method to initialize board either randomly or from a file.
* Command line argument for size and seed.
* Make it more »Ruby-ish«, esp. try to get rid of the while-loops in Board::show and Board::next_generation.
* Avoid using direct accessing the array of cells.
* Taking style guide / Rubocop into account.

[1]: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life
[2]: http://globalday.coderetreat.org
[3]: https://www.softwerkskammer.org/activities/ka-gdcr-16