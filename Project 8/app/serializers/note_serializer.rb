class NoteSerializer < ActiveModel::Serializer
  embed :id

  attributes :id, :title, :body
  has_one :category
end
