class SerializableUser < JSONAPI::Serializable::Resource
  type 'user'
  has_many :program_followers
  has_many :followed_programs, source: :program, through: :program_followers
  has_many :programs
  has_many :trainings
  alias_attribute :author_trainings, :trainings

  attributes :username, :uid
end

