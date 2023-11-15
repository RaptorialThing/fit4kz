class SerializableTraining < JSONAPI::Serializable::Resource
  type 'training'
  belongs_to :program
  belongs_to :user
  alias_attribute :author, :user

  attributes :title, :description, :video_link
end

