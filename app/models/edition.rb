class Edition < ActiveRecord::Base
  attr_accessible :active, :finish, :location, :price_in_cents, :seats, :start
  belongs_to :course
end
