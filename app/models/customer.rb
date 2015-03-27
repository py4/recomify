class Customer < ActiveRecord::Base
  has_many :recommendations
end
