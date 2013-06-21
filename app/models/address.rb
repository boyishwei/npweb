class Address < ActiveRecord::Base
  attr_accessible :address, :adress, :postcode, :user_id
  belongs_to :user
end
