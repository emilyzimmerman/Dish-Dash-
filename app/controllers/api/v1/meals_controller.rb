module Api 
    module V1 
        class MealsController < Api::V1::ApplicationController
            skip_before_action :authenticate, only: %i[index show]

            def index 
                meals = Meal.all 

                payload = {
                    meal: meals,
                    status: 200
                }
                render_success(payload: payload)
            end

            def show 
                meal = Meal.find(params[:id])

                payload = {
                    recipe: MealBlueprint.render_as_hash(meal),
                    status: 200
                }
                render_success(payload: payload)
            end
        end
    end
end