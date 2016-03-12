class RelationshipsController < ApplicationController
    before_action :authenticate_user!, only: [:show, :create, :destroy]
    
  def show
    @user = User.find(params[:joiner_user_id])
    @project = Project.find(params[:joined_project_id])
    @projects = @user.projects.group('joined_projects.id')
  end
    
  def create
    @project = Project.find(params[:joined_project_id])
    current_user.join(@project)
    
  end

  
  def destroy
    @project = current_user.joining_relationships.find(params[:id]).joined_project
    current_user.unjoin(@project)
  end
end
