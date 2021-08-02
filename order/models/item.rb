require '../mysql_connector.rb'

class Item
    attr_reader :name, :price, :id, :category

    def initialize(param)
      @id = param[:id]
      @name = name[:name]
      @price = price[:price]
      @category = category[:category]
    end


end