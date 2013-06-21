class Product < ActiveRecord::Base
  attr_accessible :available, :desc, :inventory, :name, :price
end
