require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def perform

    puts "------------------------------------------------
    |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
    |Le but du jeu est d'être le dernier survivant !|
    -------------------------------------------------"

    print "Quelle est ton nom? > "
    name = gets.chomp
    ennemies = []

    my_game = Game.new(name)


    while my_game.is_still_ongoing?

        my_game.new_players_in_sight
        my_game.show_players
        my_game.menu
        my_game.menu_choice
        gets.chomp
        my_game.enemies_attack
        gets.chomp

    end

    my_game.end

end

perform

