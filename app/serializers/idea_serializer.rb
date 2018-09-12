class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :protagonist, :antagonist, :begins, :ends, :act, :turn, :project_id
end
