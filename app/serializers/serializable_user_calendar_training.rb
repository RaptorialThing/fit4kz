class SerializableUserCalendarTraining < JSONAPI::Serializable::Resource
  type 'user_calendar_training'
  belongs_to :training
  belongs_to :user

  #attributes :training_id, :user_id
end

