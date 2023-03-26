module Reviews
    module Operations 
        def self.new_review(params, current_user)
            review = current_user.reviews.new(comment: params[:comment], recipe_id: params[:recipe_id])

            return ServiceContract.success(review) if review.save

            ServiceContract.error(review.errors.full_messages)
        end
    end
end