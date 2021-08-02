require 'mysql2'

def create_db_client #fungsi db
    client = Mysql2::Client.new(
        :host => '127.0.0.1',
        :username => 'root',
        :passworod => '',
        :database => 'yabb' 
    )
    client
end