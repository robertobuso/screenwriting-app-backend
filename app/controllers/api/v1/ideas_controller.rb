class Api::V1::IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    render json: @ideas
  end

  def show
    @idea = Idea.find(params[:id])
    render json: @idea
  end

  def create
    @idea = Idea.create(idea_params)
    if @idea
      render json: @idea, status: :accepted
    else
      render json: { errors: @idea.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    if @idea
      render json: @idea, status: :accepted
    else
      render json: { errors: @idea.errors.full_messages}, status: :unprocessable_entity
    end
  end


  private

  def idea_params
    params.permit(:title, :content, :protagonist, :antagonist, :begins, :ends, :act, :turn, :project_id, :description, :conflict, :research, :inspiration, :miscellaneous)
  end

end
