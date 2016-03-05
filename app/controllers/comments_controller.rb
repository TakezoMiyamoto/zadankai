class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
    
    def create 
        @project = Project.find(params[:project_id])
        @comment = @project.comments.build(comment_params)
        @comment.commenter = current_user.nickname
        if @comment.save
          flash[:success] = "Comment created!"
          redirect_to projects_path
        else
          render 'zadankai/home'
        end
    end
    
    
    private
    
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
