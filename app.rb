require "sinatra"

get '/msg' do
    "put this man"
end

get '/msg/:name' do
    name = params['name']
    last = 'fadil'
    color = params['color'] ? params['color'] : 'DodgerBlue'
    "<h1>put this man, #{name} #{last}</h1>"
    # erb :message, locals :{}
        # bawaan, akes message
                    #lokal itu objek, kaya color dan name
end

get '/login' do 
    erb :login
end 

get '/dashboard' do 
    erb :dashboard
end 

get '/items' do 
    erb :item
end

post '/login' do
    if params['username'] == 'admin' && params['password'] == 'admin'
        username = params['username']
        password = params['password']
        return "#{username}, #{password}"
        # redirect '/dashboard'
    else
        redirect '/login'
    end
end 