class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
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
    # 参加しているユーザー
    @users = @project.joiner_users.group('joiner_user_id')
    # 参加しているユーザーがいる場合はそのUserを取得
    if @users.any?
    @joinerUser = @project.joiner_users.find(@users)
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update(edit_project_params)
      flash[:success] = "Your project was updated!"
      redirect_to @project
    else
      render 'edit'
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
  
  def edit_project_params
    params.require(:project).permit(:project_name, :category, :main_image, :movie, :youtube_url, :description)
  end
end
