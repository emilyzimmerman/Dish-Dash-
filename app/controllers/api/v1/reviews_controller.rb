module Api
    module V1
        class ReviewsController < Api::V1::ApplicationController
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
        end
    end
end