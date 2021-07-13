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
mongol_cavalryman = MongolCavalryman.new("Mongol Cavalryman",140,70)
enemies = [mongol_archer, mongol_spearman, mongol_swordsman,mongol_cavalryman]

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
    if allies[0].name != "Jin" #preventing print menu 2nd  
        puts "2. Heal an ally"  
    end 
    menu = gets.chomp.to_i
    puts "\n"
    
    if menu == 1
        puts "Which enemy you want pick attack ?"
        enemies.each.with_index(1) do |enemy,index|
            puts "#{index}. #{enemy.name}"
        end 
        enemies_character = gets.chomp.to_i #input integer
        
        enemy = enemies[enemies_character-1]
        jin.attack(enemy)
        enemies.delete(enemy) if enemy.die? || enemy.flee?
        puts "\n"
    end 

    if menu == 2
        allies.delete(jin) #delete jin from allies[], jin cannot heal himself
        puts "Which ally you want to heal"
        
        allies.each.with_index(1) do |ally,index|
                            # starts from 1
            puts "#{index}. #{ally.name}" #print allies
        end 

        allies_character = gets.chomp.to_i #input integer
        

        ally = allies[allies_character-1]  #array starts from 0
        jin.heal(ally)
        
        puts "\n"
        allies.push(jin)
    end

    if enemies.empty?
        puts "Jin wins"        
    else
        allies.delete(jin) #delete jin from allies[], jin's turn is done    
        allies.each do |ally|
            enemy = enemies[rand(enemies.size)] #random enemy
            ally.attack(enemy) #ally attack enemy
            enemies.delete(enemy) if enemy.die? || enemy.flee? #remove enemy if die or flee
            break if enemies.empty?
            puts "\n"
        end
        allies.push(jin)

        enemies.each do |enemy|
            ally = allies[rand(allies.size)] #random allies
            enemy.attack(ally)
            if ally.name != "Jin" #preventing to remove jin
                allies.delete(ally) if ally.die? || ally.flee? #remove ally if die or flee
            end
            puts "\n" 
        end
    end

    i += 1
end 