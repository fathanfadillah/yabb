require_relative 'villain'

# class MongolArcher < Villain
#     def attack(other_person)
#         puts "#{@name} shoots an arrow at #{other_person.name} with #{@attack_damage} damage"
#         other_person.take_damage(@attack_damage)
#     end
# end

# class MongolSpearman < Villain
#     def attack(other_person)
#         puts "#{@name} thrusts #{other_person.name} with #{@attack_damage} damage"
#         other_person.take_damage(@attack_damage)
#     end
# end

# class MongolSwordsman < Villain
#     def attack(other_person)
#         puts "#{@name} slashes #{other_person.name} with #{@attack_damage} damage"
#         other_person.take_damage(@attack_damage)
#     end
# end

# class MongolCavalryman < Villain
#     def attack(other_person)
#         puts "#{@name} crashes #{other_person.name} with #{@attack_damage} damage"
#         other_person.take_damage(@attack_damage)
#     end
# end

class MongolArcher
    def attack(other_person)
        puts "#{@name} shoots an arrow at #{other_person.name} with #{@attack_damage} damage"
        other_person.take_damage(@attack_damage)
    end
end

class MongolSpearman
    def attack(other_person)
        puts "#{@name} thrusts #{other_person.name} with #{@attack_damage} damage"
        other_person.take_damage(@attack_damage)
    end
end

class MongolSwordsman
    def attack(other_person)
        puts "#{@name} slashes #{other_person.name} with #{@attack_damage} damage"
        other_person.take_damage(@attack_damage)
    end
end

class MongolCavalryman
    def attack(other_person)
        puts "#{@name} crashes #{other_person.name} with #{@attack_damage} damage"
        other_person.take_damage(@attack_damage)
    end
end
