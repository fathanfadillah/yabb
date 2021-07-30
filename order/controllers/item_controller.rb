require 'erb'
require_relative '../models/category.rb'


def get_all_categories
    categories = Category.all
    renderer = ERB.new(File.read('views/template.erb'))
    renderer.result(binding)
end
