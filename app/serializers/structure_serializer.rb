class StructureSerializer < ActiveModel::Serializer
  attributes :id, :saved, :title, :order, :created_at, :project_id
end
