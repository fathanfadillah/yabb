require_relative 'person'

jin = Person.new("Jin",100,50) #urutannya harus sesuai dengan parameter state di class
                 #nama,hp,atk
puts jin #cari to s atau balikannya objek
puts "\n"

khotun = Person.new("Khotun",500,50)
puts khotun
puts "\n"

loop do 
    jin.attack(khotun)
       #method #other_person
       #attack
    puts khotun
    puts "\n"
    break if khotun.die? #break if maksutnya break jika khotun.die ini hasilnya
                    #method die?
    khotun.attack(jin)
    puts jin
    puts "\n"
    break if jin.die?
end 