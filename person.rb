class Person
    attr_reader :name, :hitpoint, :attack_damage #kaya geter seternya
    # dalam kasus ini supaya other_person bisa akses namenya
 
                     #parameter
    def initialize(name, hitpoint, attack_damage) #inisialisasi (state)
      @name = name #atribut
      @hitpoint = hitpoint #atribut
      @attack_damage = attack_damage #atribut
    end

    def attack(other_person)
        if other_person.name == "Jin"
            if rand() <= 0.8 #rand() nilainya (0-1), kalo kurang dari sama dengan 0.8 maka ketangkis
                puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
                      # namenya si person bukan other person
                puts "#{other_person.name} menangkis serangan #{@name}"
            else #kalo hasilnya lebih dari 0.8 maka tidak ketangkis
                other_person.take_damage(@attack_damage)            
                puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
            end
        else #nah ini berarti jin yang serang khotun, khotun kan gabisa nangkis
            other_person.take_damage(@attack_damage) #parameternya attack_damage si person bukan other person
                         #method take_damage yang dibawah
            puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
        end
    end 

    def take_damage(damage) #kena damage
                   #parameter attack damage si person
        @hitpoint -= damage #hp nya si other person, karena dipanggil dgn other_person.take_damage
    end

    def to_s #to string, akan muncul kalo pake puts
        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage"
    end 

    def die?
        if @hitpoint <= 0
            puts "#{@name} dies"
            true #supaya keluar dari loop dengan menghasilkan true, true nilainya 1 (bool)
        end
    end  

end