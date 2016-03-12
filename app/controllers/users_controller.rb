class UsersController < ApplicationController
  
  before_action :set_user, only:[:show, :edit, :update, :joiner]
  
  def index
    @users = User.all
  end

  def show
    
    # 自分のプロジェクト一覧
    @projects = @user.projects.group('projects.id')
    # 参加中のプロジェクト一覧
    @joinProjects = @user.joined_projects.group('projects.id')
  end
  
  def edit
    
  end
  
  def update
    if @user.update(edit_user_params)
      flash[:success] = "Your profile was updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  
  private
  
  def edit_user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :avatar)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  
  
end
