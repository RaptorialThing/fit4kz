class SerializableUser < JSONAPI::Serializable::Resource
  type 'user'
  has_many :program_followers
  has_many :programs, through: :program_followers
  has_many :trainings
  alias_attribute :author_trainings, :trainings

  attributes :username, :uid
end

