class TrainingSerializer < JSONAPI::Serializable::Resource
  type 'trainings'
  belongs_to :program
  belongs_to :user
  alias_attribute :author, :user

  attributes :id,:title, :description, :video_link
end

