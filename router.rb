require 'sinatra'
require './db_connector'

get '/' do
    items = get_all_items
    erb :index, locals: {
        items: items
    }
end 

# create
get '/items/new' do 
    erb :create
end 

get '/items/create' do 
    name = params[:name]
    price = params[:price]
    create_item(name, price)
    redirect '/'
end
#  

# show
get '/items/show/:id' do
    id = params[:id]
    items = get_all_item_with_categories(id)
    erb :show, locals: {
        items: items
    }
end
# 

#update
get '/items/edit/:id' do
    id = params[:id]
    items = get_all_item_with_categories(id)
    categories = get_all_categories
    erb :edit, locals: {
        items: items,
        categories: categories
    }
end

post '/update/:id' do
    id = params[:id]
    name = params[:name]
    price = params[:price]
    category = params[:category]
    update_item(id, name, price, category)
    redirect '/'
end 
#

#delete
get '/items/delete/:id' do
    id = params[:id] 
    delete_item(id)
    redirect '/'
end
# 