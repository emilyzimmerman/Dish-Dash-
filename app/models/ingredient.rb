class Ingredient < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :recipes
    validates :name, :quantity, presence: true 
end
