class Todo < ApplicationRecord 
  validates :name, :description,  presence: true
end