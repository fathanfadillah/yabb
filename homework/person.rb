class Person
    attr_reader :name, :hitpoint, :attack_damage, :deflect 
   
    def initialize(name, hitpoint, attack_damage, deflect, heal) 
      @name = name 
      @hitpoint = hitpoint 
      @attack_damage = attack_damage 
      @deflect = deflect
      @heal = heal
    end

    def attack(other_person)
        puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
        other_person.take_damage(@attack_damage)
    end 

    def take_damage(damage)
        random = rand() #get random value
        if random * 100 <= @deflect
            puts "#{@name} deflect the attacks"
        else
            @hitpoint -= damage 
        end  
    end

    def heal(other_person)
        other_person.hitpoint += @heal
        puts "#{@name} heals #{other_person.name}, restoring #{@heal} hitpoints"
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