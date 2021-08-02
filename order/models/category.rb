require_relative '../mysql_connector.rb'

class Category
    attr_reader :name, :id

    def initialize(param)
        @id = param["id"]
        @name = param["name"]
    end
    
    def self.all
        client = create_db_client
        result = client.query("select * from categories")
        convert_sql_result_to_array(result)
    end

    def self.save
        client = create_db_client
        result = client.query("insert into categories values ('#{@name}')")
    end
    
    def self.convert_sql_result_to_array(result)
        categories = Array.new
        result.each do |data|
            rawData = Category.new(data) 
            categories.push(rawData) 
        end
        categories
    end 
end
