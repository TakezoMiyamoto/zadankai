class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update, :destroy]
    
    def create
        @project = Project.find(params[:project_id])
        @comment = @project.comments.build(comment_params)
        @comment.commenter = current_user.nickname
        @comment.avatar = current_user.avatar.url
        @comment.remote_avatar = current_user.remote_avatar
        
        
        if @comment.save
          flash[:success] = "Comment created!"
          redirect_to project_path(@project)
        else
          render 'zadankai/home'
        end
    end
    
    
    private
    
    def comment_params
        params.require(:comment).permit(:commenter, :body, :avatar, :remote_avatar)
    end
end
