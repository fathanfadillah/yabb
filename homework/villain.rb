require_relative 'person'

class Villain < Person
    attr_accessor :hitpoint

    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
        @flee_precentage = 0.5
        @fled = false
    end
    
    def take_damage(damage)
        @hitpoint -= damage     
        if @hitpoint <= 50
            flee if rand < @flee_precentage
        end  
    end

    def flee 
        @fled = true
        puts "#{@name} has fled the battlefield with #{@hitpoint} hitpoint left"
    end
    
    def flee?
        @fled
    end 
end 