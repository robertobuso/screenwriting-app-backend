class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :protagonist, :antagonist, :begins, :ends, :act, :turn, :description, :conflict, :research, :inspiration, :miscellaneous, :project_id

  belongs_to :project
end
