class Api::V1::StructuresController < ApplicationController
  before_action :find_structure, only: [:update]

  def index
    @structures = Structure.all

    render json: @structures
  end

  def create
    @structure = Structure.new(structure_params)
    if @structure.saved
      @structure.order = Structure.generate_array(@structure.order)
        if @structure.save
          render json: @structure, status: :accepted
        else
          render json: { errors: @structure.errors.full_messages}, status: :unprocessable_entity
        end
    elsif @structure.save
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
    params.permit(:title, :saved, :project_id, {:order => (1..100).map(&:to_s)})
  end

  def find_structure
    @structure = Structure.find(params[:id])
  end

end
