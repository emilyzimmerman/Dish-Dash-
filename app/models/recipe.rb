class Recipe < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :ingredients
  belongs_to :meal

  validates :name, :content, presence: true 
end
