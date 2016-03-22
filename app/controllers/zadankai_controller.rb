class ZadankaiController < ApplicationController
  def home
    @projects = Project.order(created_at: :desc).limit(6)
  end
  
  def about
  
  end
end
