require_relative 'person'
require_relative 'mongol'
require_relative 'villain'

jin = Person.new("Jin",100,50,80,20)

yuna = Villain.new("Yuna",90,45)
sensei = Villain.new("Sensei Ishika",80,60)
allies = [yuna,sensei,jin]

mongol_archer = MongolArcher.new("Mongol Archerman",80,40)
mongol_spearman = MongolSpearman.new("Mongol Spearman",120,60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman",100,50)
enemies = [mongol_archer, mongol_spearman, mongol_swordsman]

i = 1
until (jin.die? || enemies.empty?) do 
    puts "===== Turn #{i} ====="
    puts "\n"
    
    allies.each do |ally|
        puts ally
    end

    puts "\n" 
    
    enemies.each do |enemy|
        puts enemy
    end
    

    puts "\n"
    puts "As #{jin.name}, what do you want to do this turn ?"
    puts "1. Attack an enemy"
    if allies[0].name != "Jin"
        puts "2. Heal an ally"
    end 
    menu = gets.chomp.to_i
    puts "\n"
    
    if menu == 1
        puts "Which enemy you want pick attack ?"
        enemies.each.with_index(1) do |enemy,index|
            puts "#{index}. #{enemy.name}"
        end 
        enemies_character = gets.chomp.to_i
        
        enemy = enemies[enemies_character-1]
        jin.attack(enemy)
        enemies.delete(enemy) if enemy.die? || enemy.flee?
        puts "\n"
    end 

    if menu == 2
        allies.delete(jin)
        puts "Which ally you want to heal"
        
        allies.each.with_index(1) do |ally,index|
            puts "#{index}. #{ally.name}"
        end 

        allies_character = gets.chomp.to_i
        

        ally = allies[allies_character-1]
        jin.heal(ally)
        
        puts "\n"
        allies.push(jin)
    end

    if enemies.empty?
        puts "Jin wins"        
    else
        allies.delete(jin)      
        allies.each do |ally|
            enemy = enemies[rand(enemies.size)]
            ally.attack(enemy)
            enemies.delete(enemy) if enemy.die? || enemy.flee?
            break if enemies.empty?
            puts "\n"
        end
        allies.push(jin)
        

        enemies.each do |enemy|
            ally = allies[rand(allies.size)]
            enemy.attack(ally)
            if ally.name != "Jin"
                allies.delete(ally) if ally.die? || ally.flee?
            end
            puts "\n" 
        end
    end

    i += 1
end 