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
    pseudo = gets.chomp
    ennemies = []

    player = HumanPlayer.new(pseudo)
    enemy1 = Player.new ("Josiane")
    enemy2 = Player.new ("José")

    ennemies << enemy1
    ennemies << enemy2

    while player.life_points >0 && (enemy1.life_points > 0 || enemy2.life_points >0)


        puts player.show_state
        puts " " 

        puts "Quelle action veux-tu effectuer ?"
        puts " "
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"

        puts "Attaquer un joueur en vue :"
        print "0 -"
        (enemy1.life_points >0) ? (puts " #{enemy1.show_state}") : ( puts "#{enemy1.name} is dead")
        print "1 -"
        (enemy2.life_points >0) ? (puts " #{enemy2.show_state}") : ( puts "#{enemy2.name} is dead")

        print "> "
        choice = gets.chomp
        
        puts " "
        puts " "

        case 
        when choice == "a"
            player.search_weapon
        
        when choice == "s"
            player.search_health_pack

        when choice.to_i == 0
            player.attacks(enemy1)

        when choice.to_i == 1
            player.attacks(enemy2)

        else puts "You didn't write a correct choice"
        end 

        puts " "

        puts "Les autres joueurs t'attaquent !"
        puts " "
        ennemies.each do |enemy|
            if enemy.life_points > 0 
            then  enemy.attacks(player)
            end 
        end
        puts " "



    end 





    puts "La partie est finie"
    if player.life_points > 0
        puts "BRAVO ! TU AS GAGNE !" 
    else puts "Loser ! Tu as perdu !"
    end

end

perform