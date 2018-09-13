class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :protagonist, :created_at, :updated_at

  has_many :ideas
  has_many :structures
end
