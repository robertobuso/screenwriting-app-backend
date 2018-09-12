class Api::V1::StructuresController < ApplicationController
  before_action :find_structure, only: [:update]

  def index
    @structures = Structure.all
    render json: @structures
  end

  def create
    @structure = Structure.create(structure_params)
    if @structure
      Structure.generate_array(@structure.order)

      render json: @structure, status: :accepted
    else
      render json: { errors: @structure.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @structure.update(structure_params)
    if @structure.save
      render json: @structure, status: :accepted
    else
      render json: { errors: @structure.errors.full_messages}, status: :unprocessable_entity
    end
  end


  private

  def structure_params
    params.permit(:title, :saved, :order_of_ideas, :order, :project_id)
  end

  def find_structure
    @structure = Structure.find(params[:id])
  end

end
