require 'erb'
require_relative '../models/category.rb'


def get_all_categories
    categories = Category.all
    renderer = ERB.new(File.read('views/templates/list.erb'))
    renderer.result(binding)
end

def add_category
    status_add = 'category'
    renderer = ERB.new(File.read('views/templates/add.erb'))
    renderer.result(binding)
    # erb :"templates/add"
end 
