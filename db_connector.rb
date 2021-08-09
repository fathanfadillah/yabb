require 'mysql2'
require './category'
require './item'

def create_db_client #fungsi db
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :passworod => "",
        :database => "yabb" 
    )
end 

def get_all_items
    client = create_db_client #simpan fungsi db
    items = client.query("select * from items")
end 

def get_all_categories
    client = create_db_client
    categories = client.query("select * from categories")
end 

def get_all_item_with_categories
    client = create_db_client
    item_categories = client.query("
        Select items.id as 'id', items.name as 'name', items.price as 'price', categories.name as 'category'
        from item_categories
        left join items on items.id = item_categories.item_id 
        left join categories on categories.id = item_categories.category_id        
        ")
    # items = Array.new #make null array
    
    # rawData.each do |data|
        # category = Category.new()
    # end
end

def delete_item(id)
    client = create_db_client
    client.query("delete from items where item_id = #{id}")
end

def create_item(name, price)
    client = create_db_client
    client.query("insert into items(name, price) values('#{name}','#{price}')")
end

def get_all_item_with_categories(id)
    client = create_db_client
    item_categories = client.query("
        Select items.id as 'id', items.name as 'name', items.price as 'price', categories.name as 'category'
        from item_categories
        left join items on items.id = item_categories.item_id 
        left join categories on categories.id = item_categories.category_id        
        where items.id = '#{id}'
        ")
    # items = Array.new #make null array
    
    # rawData.each do |data|
        # category = Category.new()
    # end
end

def update_item(id, name, price, category)
    client = create_db_client
    client.query("update items set name = '#{name}', price = '#{price}' where id = '#{id}' ");
    client.query("update item_categories set category_id = #{category} where item_id = '#{id}' ");
end