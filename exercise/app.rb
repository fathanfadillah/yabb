require_relative 'person'
require_relative 'mongol'
require_relative 'villain'

jin = Person.new("Jin",100,50,80)
mongol_archer = MongolArcher.new("Mongol Archerman",80,40)
mongol_spearman = MongolSpearman.new("Mongol Spearman",120,60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman",100,50)
villains = [mongol_archer, mongol_spearman, mongol_swordsman]

i = 1
until (jin.die? || villains.empty?) do 
    puts "===== Turn #{i} ====="
    puts "\n"
    
    puts jin
    jin.attack(villains[rand(villains.size)])
    villains.each do |villain|
        villains.delete(villain) if villain.die? || villain.flee?
    end
    puts "\n" 

    villains.each do |villain|
        villain.attack(jin)
    end 
    puts "\n"

    i += 1
end 