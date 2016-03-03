class ProjectsController < ApplicationController
  def readyfor
  end

  def new
    @project = Project.new
  end
end
