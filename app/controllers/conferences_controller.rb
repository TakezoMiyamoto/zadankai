class ConferencesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update, :destroy]
    def index
        @project = Project.find(params[:project_id])
        @conferences = Conference.all
    end
    
    def new
        @project = Project.find(params[:project_id])
        @conference = Conference.new
        
    end
    
    def create 
        @project = Project.find(params[:project_id])
        @conference = @project.conferences.build(conference_params)
        if @conference.save
          flash[:success] = "Conference created!"
          redirect_to project_path(@project)
        else
          render 'zadankai/home'
        end
    end
    
    def show
        @project = Project.find(params[:project_id])
        @conference = Conference.find(params[:id])
    end
  
    def edit
        @project = Project.find(params[:project_id])
        @conference = Conference.find(params[:id])
    end
    
    def update
        @project = Project.find(params[:project_id])
        @conference = Conference.find(params[:id])
        if @conference.update(edit_conference_params)
          flash[:success] = "Your project was updated!"
          redirect_to @conference
        else
          render 'edit'
        end
    end

    def destroy
        @conference = current_user.conferences.find_by(id: params[:id])
        return redirect_to root_url if @conference.nil?
        @conference.destroy
        flash[:success] = "この会議室は削除しました"
        redirect_to conferences_path
    end
    
    private
    
    def conference_params
        params.require(:conference).permit(:title, :description)
    end
    
    def edit_conference_params
        params.require(:conference).permit(:title, :description)
    end
end
