class Api::V1::ProjectsController < ApplicationController
  def index
    @projects = Project.all
    render json: Project.test(@projects)
  end
  def show
    @project = Project.find(params[:id])
    render json: @project
  end
  def create
    @project = Project.create(project_params)
    if @project
      render json: @project, status: :accepted
    else
      render json: { errors: @project.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def update
    @project.update(project_params)
    if @project.save
      render json: @project, status: :accepted
    else
      render json: { errors: @project.errors.full_messages}, status: :unprocessable_entity
    end
  end
  private
  def project_params
    params.permit(:title, :protagonist)
  end
end
