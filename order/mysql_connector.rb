require 'mysql2'

def create_db_client #fungsi db
    client = Mysql2::Client.new(
        :host => ENV["DB_HOST"],
        :username => ENV["DB_USERNAME"],
        :passworod => ENV["DB_PASSWORD"],
        :database => ENV["DB_NAME"] 
    )
    client
end