class StructureSerializer < ActiveModel::Serializer
  attributes :id, :saved, :title, :order,:search, :search_by, :created_at, :project_id

  belongs_to :project
end
