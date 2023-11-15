class SerializableProgram < JSONAPI::Serializable::Resource
  type 'program'
  has_many :trainings
  has_many :program_followers
  has_many :users, through: :program_followers
  belongs_to :user
  alias_attribute :author, :user

  attributes :title, :description

end

