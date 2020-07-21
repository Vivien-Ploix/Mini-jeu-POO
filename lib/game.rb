require 'pry'

class Game
    attr_accessor :human_player, :enemies, :players_left


    def initialize(name)

        @enemies_in_sight = Array.new

        @human_player = HumanPlayer.new(name)
        @enemies_in_sight << @enemy1 = Player.new("enemy1")
        @enemies_in_sight << @enemy2 = Player.new("enemy2")
        @enemies_in_sight << @enemy3 = Player.new("enemy3")
        @enemies_in_sight << @enemy4 = Player.new("enemy4")

        @players_left = 10

    end 

    def kill_player
        @enemies_in_sight.each do |enemy|
            if enemy.life_points <=0 
                @enemies_in_sight.delete(enemy)
                @players_left -=1
            end
        end
    end 

    def is_still_ongoing?
        (@human_player.life_points > 0 && (@players_left != 0 || @enemies_in_sight !=0)) ? (return true) : (return false)
    end 

    def show_players
        puts @human_player.show_state
        puts "Il y a #{@enemies_in_sight.count} ennemis en vue"
    end 


    def menu
        puts "Quelle action veux-tu effectuer ?"
        puts " "
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner"

        puts "Attaquer un joueur en vue :"

        i = 0
        for enemy in @enemies_in_sight do 
            if enemy.life_points > 0 
                then print "#{i} -"
                puts "#{enemy.show_state}"
            end
            i += 1  
        end 

            
    end 


    def menu_choice

        print "> "
        choice = gets.chomp
        
        puts " "
        puts " "

        case 
        when choice == "a"
            @human_player.search_weapon
        
        when choice == "s"
            @human_player.search_health_pack

        
        when choice.to_i >=0 && choice.to_i < @enemies_in_sight.size
            @human_player.attacks(@enemies_in_sight[choice.to_i])


        else puts "Tu n'as pas fait un choix correct, passe ton tour"
        end 

        kill_player

        puts " "
    end 

    def enemies_attack

        puts "Les autres joueurs t'attaquent !"
        puts " "
        @enemies_in_sight.each do |enemy|
            if enemy.life_points > 0 
            then  enemy.attacks(@human_player)
            end 
        end
        puts " "
    end 


    def end 
        puts "La partie est finie"
        if @human_player.life_points > 0
            puts "BRAVO ! TU AS GAGNE !" 
        else puts "Loser ! Tu as perdu !"
        end
    end 


    def new_players_in_sight
        if @players_left == @enemies_in_sight.size
            puts "Tous les joueurs sont déjà en vue"
        else
            rolled_number = rand(1..6)
            if rolled_number == 1
                puts "Aucun nouvel ennemi n'arrive"
            elsif rolled_number == 2 || rolled_number == 3 || rolled_number == 4
                random_name = "enemy" + rand(1..1000).to_s
                puts "Un nouvel ennemi est en vue !"
                new_enemy = Player.new(random_name)
                @enemies_in_sight << new_enemy
            elsif rolled_number == 5 || rolled_number == 6
                random_name1 = "enemy" + rand(1..1000).to_s
                random_name2 = "enemy" + rand(1..1000).to_s
                puts "Deux nouveaux ennemis sont en vue !!"
                new_enemy1 = Player.new(random_name1)
                new_enemy2 = Player.new(random_name2)
                @enemies_in_sight << new_enemy1
                @enemies_in_sight << new_enemy2
            end
        end
    end 

    
end 