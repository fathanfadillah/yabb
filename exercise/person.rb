class Person
    attr_reader :name, :hitpoint, :attack_damage, :deflect 
   
    def initialize(name, hitpoint, attack_damage, deflect) 
      @name = name 
      @hitpoint = hitpoint 
      @attack_damage = attack_damage 
      @deflect = deflect
    end

    def attack(other_person)
        puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
        other_person.take_damage(@attack_damage)
    end 

    def take_damage(damage)
        random = rand()
        if random * 100 <= @deflect
            puts "#{@name} deflect the attacks"
        else
            @hitpoint -= damage 
        end  
    end


    def to_s 
        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage"
    end 

    def die?
        if @hitpoint <= 0
            puts "#{@name} dies"
            true
        end
    end  

end