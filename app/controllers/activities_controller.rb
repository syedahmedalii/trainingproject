class ActivitiesController < ApplicationController
    def create
        @task = Task.find(params[:task_id])
        @activity = @task.activities.create(activities_params)
        if @activity.save
            redirect_to task_path(@task)
        else
            
        end
        
        
    end

    private
        def activities_params
            params[:activity].permit(:body)
        end
end
