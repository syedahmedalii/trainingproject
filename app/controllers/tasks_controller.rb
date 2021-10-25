class TasksController < ApplicationController
    before_action :select_user
    def index
        @currentUser = current_user.id
        @tasks = Task.all.order("created_at DESC")
        others_tasks
    end

    def others_tasks
        x = Reviewer.all.where(child_id: current_user.id)
        for value in x do
            @parent_task = Task.where(id: value.post_id)
        end
    end
    

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        @task.user = current_user
        if @task.save
            redirect_to @task
        else
            render 'new'
        end
    end

    def show
        
        @task = Task.find(params[:id])
        get_reviewers
    end

    def edit
        @task = Task.find(params[:id])
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to root_path
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to @task
        else
            render 'edit'
        end
    end

    def select_user
        @selecting_user = []
        users_all = User.all.where("id != ?", current_user.id).select(&:id)
        for x in users_all do
            dummy_arr = [x.email, x.id]
            @selecting_user = @selecting_user.push(dummy_arr)
        end
    end

    def get_reviewers
        @id_arr = []
        all_reviewers_id = Reviewer.all.where(admin_id: current_user.id, post_id: @task.id)
        for x in all_reviewers_id do
            email = User.where(id: x.child_id).pluck(:email)
            @some_id = x
            @id_arr.push(email)
        end
    end

    def create_room
        flash.now[:alert] = 'Error while sending message!'

    end
    
    



    private
        def task_params
            params.require(:task).permit(:title, :description)
        end

        def review_params
            params.require(:review).permit(:child_id)
        end
end
