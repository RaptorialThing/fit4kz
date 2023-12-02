class SerializableUserCalendarTraining < JSONAPI::Serializable::Resource
  type 'user_calendar_training'
  belongs_to :training
  belongs_to :user

  attributes :icube_rule, :last_date, :training_datetime
end

