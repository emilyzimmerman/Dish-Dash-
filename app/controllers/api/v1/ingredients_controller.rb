module Api 
    module V1 
        class IngredientsController < Api::V1::ApplicationController
            def create
                 #FIXME NEED TO MAKE RELATION BETWEEN USER AND INGREDIENTS
                result = Ingredients::Operations.new_ingredient(params, @current_user)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    ingredient: IngredientBlueprint.render_as_hash(ingredients),
                    status: 201
                }
                render_success(payload: payload)
            end 

            def index 
                ingredients = Ingredient.all 

                payload = {
                    ingredient: IngredientBlueprint.render_as_hash(ingredients),
                    status: 200
                }
                render_success(payload: payload)
            end

            def show 
                ingredient = Ingredient.find(params[:id])

                payload = {
                    ingredient: IngredientBlueprint.render_as_hash(ingredient),
                    status: 200
                }
                render_success(payload: payload)
            end
            
            def update 
                result = Ingredients::Operations.update_ingredient(params, @current_user)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    recipe: IngredientBlueprint.render_as_hash(result.payload), 
                    status: 201
                }
                render_success(payload: payload)
            end

            def destroy 
                ingredient = Ingredient.find(params[:id])

                ingredient.destroy
                render_success(payload: "Ingredient successfully destroyed", status: 200)
            end
        end
    end
end