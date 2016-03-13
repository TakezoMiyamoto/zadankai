class OpinionsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update, :destroy]
    
    def create 
        @project = Project.find(params[:project_id])
        @conference = Conference.find(params[:conference_id])
        @opinion = @conference.opinions.build(opinion_params)
        @opinion.opinion_user = current_user.nickname
        @opinion.avatar = current_user.avatar.url
        @opinion.remote_avatar = current_user.remote_avatar
        
        if @opinion.save
          flash[:success] = "Opinion created!"
          redirect_to project_conference_path(@project, @conference)
        else
          render 'zadankai/home'
        end
    end
    
    
    
    
    private
    
    def opinion_params
        params.require(:opinion).permit(:opinion_user, :body)
    end
end
