class Wli
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def likes
        count = @name.size
        "#{@name}"
        # if count == 0 
        #     "no one like this" 
        # elsif count == 1
        #     "#{@name[0]} like this"
        # end 
    end 
end

wli = Wli.new(["Peter"])
wli.likes