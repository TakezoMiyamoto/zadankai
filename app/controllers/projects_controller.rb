class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  
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
      flash[:success] = "新規プロジェクトを作成しました"
      redirect_to projects_path
    else
      render 'zadankai/home'
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    
  end
  
  def update
    respond_to do |format|
      if @project.update(article_params) && @project.video.recreate_versions!
        format.html { redirect_to @project, notice: 'project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = current_user.projects.find_by(id: params[:id])
    return redirect_to root_url if @project.nil?
    @project.destroy
    flash[:success] = "Project deleted"
    redirect_to projects_path
  end
  
  private
  def project_params
    params.require(:project).permit(:project_name, :category, :main_image, :movie, :youtube_url, :description)
  end
end
