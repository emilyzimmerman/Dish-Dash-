module Api 
    module V1 
        class RecipesController < Api::V1::ApplicationController
            skip_before_action :authenticate, only: %i[home show]

            def create 
                result = Recipes::Operations.new_recipe(params, @current_user)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    recipe: RecipeBlueprint.render_as_hash(result.payload), 
                    status: 201
                }
                render_success(payload: payload)
            end

            def index 
                recipes = Recipe.all 

                payload = {
                    recipe: RecipeBlueprint.render_as_hash(recipes),
                    status: 200
                }
                render_success(payload: payload)
            end

            def show 
                recipe = Recipe.find(params[:id])

                payload = {
                    recipe: RecipeBlueprint.render_as_hash(recipe),
                    status: 200
                }
                render_success(payload: payload)
            end

            def update 
                result = Recipes::Operations.update_recipe(params, @current_user)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    recipe: RecipeBlueprint.render_as_hash(result.payload), 
                    status: 201
                }
                render_success(payload: payload)
            end

            def destroy
                #exception --> refer to "rescue operation"
                recipe = Recipe.find(params[:id])

                recipe.destroy 
                render_success(payload: "Recipe successfully destroyed", status: 200)
            end

            def home 
                render_success(payload: {suggested: RecipeBlueprint.render_as_hash(Recipe.order("RANDOM()")), meals: Meal.all})
            end
        end
    end
end