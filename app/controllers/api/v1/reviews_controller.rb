module Api
    module V1
        class ReviewsController < Api::V1::ApplicationController
            skip_before_action :authenticate, only: %i[index]

            def create
                result = Reviews::Operations.new_review(params, @current_user)
                render_error(errors: 'There was a problem creating a review', status: 400) and return unless result.success?
                payload = {
                  review: ReviewBlueprint.render_as_hash( result.payload),
                  status: 201
                }
                #  TODO: Invite user to accept invitation via registered email
                render_success(payload: payload)
            end

            def index
                reviews = Review.all 
                #define payload 
                payload = {
                    review: ReviewBlueprint.render_as_hash(reviews),
                    status: 201
                }
                render_success(payload: payload)
            end

            def show 
                review = Review.find(params[:id])
                payload = {
                    review: ReviewBlueprint.render_as_hash(review),
                    status: 201
                }
                render_success(payload: payload)
            end

            def update 
                result = Reviews::Operations.update_review(params, @current_user)
                render_error(errors: 'There was a problem updating the review', status: 400) and return unless result.success?
                payload = {
                  review: ReviewBlueprint.render_as_hash( result.payload),
                  status: 201
                }
                #  TODO: Invite user to accept invitation via registered email
                render_success(payload: payload)
            end

            def destroy 
                review = Review.find(params[:id])

                review.destroy
                render_success(payload: "Review successfully destroyed", status: 200)
            end
        end
    end
end