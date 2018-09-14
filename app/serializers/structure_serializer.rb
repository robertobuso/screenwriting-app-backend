class StructureSerializer < ActiveModel::Serializer
  attributes :id, :saved, :title, :order, :created_at, :project_id

  belongs_to :project
end
