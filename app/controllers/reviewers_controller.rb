class ReviewersController < ApplicationController

    def create
        @reviewer = Reviewer.new(review_params)
        @reviewer.admin_id = current_user.id
        @reviewer.post_id = params[:subaction]
        if @reviewer.save
            redirect_to root_path
        else
            redirect_to tasks_path
        end
        
    end

    private
        def review_params
            params.require(:reviewer).permit(:child_id)
        end
end
