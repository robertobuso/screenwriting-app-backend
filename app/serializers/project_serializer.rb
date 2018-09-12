class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :protagonist, :created_at, :updated_at
end
