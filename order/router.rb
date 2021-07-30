require 'sinatra'
require 'require_all'
require_all './controllers'

get '/' do
    # items = get_all_items
    # categories = get_all_categories
    # erb :index, locals: {
    #     categories: categories
    # }
    erb :"pages/home", :layout => :"layouts/app" 
end

get '/category' do
    erb :"pages/category" 
end

get '/category/list' do
    categories = get_all_categories
end


get '/category/create' do
    add = add_category
end


# create
# get '/items/new' do 
#     erb :create
# end 

# get 'items/create' do 
#     params
#     redirect '/'
# end
# #  

# # show
# get '/items/show/:id' do
#     id = params[:id]
#     items = get_all_item_with_categories(id)
#     erb :show, locals: {
#         items: items
#     }
# end
# # 

# #update
# # get '/items/edit/:id' do
# #     id = params[:id]
# #     items = get_all_item_with_categories(id)
# #     categories = get_all_categories
# #     erb :edit, locals: {
# #         items: items
# #         categories: categories
# #     }
# # end

# get '/items/update/:id' do
#     id = params[:id]
#     redirect '/'
# end 
# #

# #delete
# get '/items/delete/:id' do
#     id = params[:id] 
#     delete_item(id)
#     redirect '/'
# end
# # 