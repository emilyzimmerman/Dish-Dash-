module Api 
    module V1 
        class RecipesController < Api::V1::ApplicationController
            def create 
                result = Recipes::Operations.new_recipe(params, @current_user)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    recipe: RecipeBlueprint.render_as_hash(result.payload), 
                    status: 201
                }
                render_success(payload: payload)
            end
        end
    end
end