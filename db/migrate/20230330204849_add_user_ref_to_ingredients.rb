class AddUserRefToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :user, foreign_key: true
  end
end
