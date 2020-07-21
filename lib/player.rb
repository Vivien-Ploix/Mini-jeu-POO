require 'pry'

class Player

    attr_accessor :name, :life_points

    def initialize(name)
        @name = name
        @life_points = 10
    end 

    def show_state
        print "#{@name} a #{@life_points} points de vie"
    end 


    def gets_damage(damage)
        @life_points = @life_points - damage
        (@life_points <=0 ) ? (puts "Le joueur #{@name} a été tué !") : ()
        return @life_points
    end 


    def attacks(player_attacked)
        puts "#{@name} attaque #{player_attacked.name}"
        attack_damage = compute_damage
        puts "Il lui inflige #{attack_damage} points de dégats."
        player_attacked.life_points = player_attacked.gets_damage(attack_damage)

    end

    def compute_damage
        return rand(1..6)
    end

end 

class HumanPlayer < Player
    attr_accessor :weapon_level, :name

    def initialize(name)
        super(name)
        @name = name
        @life_points = 100
        @weapon_level = 1
        
    end
    
    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        weapon_found_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{weapon_found_level}"

        if weapon_found_level > @weapon_level
            @weapon_level = weapon_found_level
            puts "Youhou, elle est meilleure que ton arme actuelle : tu la prends."
        else 
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end 

    def search_health_pack
        dice_throw = rand(1..6)

        if dice_throw == 1
            puts "Dommage, tu n'as rien trouvé..."

        elsif dice_throw > 1 && dice_throw < 6
            (@life_points + 50 >= 100) ? (@life_points = 100) : (@life_points = @life_points + 50)
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        
        else (@life_points +80 >= 100) ? (@life_points = 100) : (@life_points = @life_points + 80)
            puts "Waow, tu as trouvé un pack de +80 points de vie !"

        end 

    end 


end 

