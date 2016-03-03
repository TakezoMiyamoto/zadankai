class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  def readyfor
  end
  
  def index
    @projects = Project.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      
      redirect_to root_url
    else
      render 'zadankai/home'
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  private
  def project_params
    params.require(:project).permit(:project_name, :category, :main_image)
  end
end
