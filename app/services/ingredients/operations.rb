module Ingredients
    module Operations
        def self.new_ingredient(params, current_user)
            ingredient = current_user.ingredients.new(name: params[:name], quantity: params[:quantity], recipe_ids: params[:recipe_ids])

            return ServiceContract.success(ingredient) if ingredient.save

            ServiceContract.error(ingredient.errors)
        end

        def self.update_ingredient(params, current_user)
            ingredient = Ingredient.find(params[:id])
            return ServiceContract.success(ingredient) if ingredient.update(name: params[:name], quantity: params[:quantity], recipe_ids: params[:recipe_ids])
            
            ServiceContract.error(ingredient.errors.full_messages)
        end
    end
end