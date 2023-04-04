class AddRecipeIdToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :recipe, foreign_key: true
  end
end
