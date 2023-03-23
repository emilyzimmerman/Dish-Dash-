module Recipes 
    module Operations
        def self.new_recipe(params, current_user)
            #Define recipe
            recipe = current_user.recipes.new(name: params[:name], content: params[:content], image_path: params[:image_path], meal_id: params[:meal_id])

            return ServiceContract.success(recipe) if recipe.save

            ServiceContract.error(recipe.errors.full_messages)
        end

        def self.update_recipe(params, current_user)
            # Grab existing recipe
            recipe = Recipe.find(params[:id])
            return ServiceContract.success(recipe) if recipe.update(name: params[:name], content: params[:content], image_path: params[:image_path], meal_id: params[:meal_id])

            ServiceContract.error(recipe.errors.full_messages)
        end
    end
end