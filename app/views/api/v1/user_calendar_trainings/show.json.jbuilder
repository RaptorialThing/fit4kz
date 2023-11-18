# frozen_string_literal: true

json.data do
  json.id @user_calendar_training.id.to_s
  json.type "user_calendar_training"
  json.attributes do
    json.partial! "user_calendar_training", user_calendar_training: @user_calendar_training
  end

  json.relationships do
    json.training do
      json.partial! 'training', training: @user_calendar_training.training
    end
    json.user do
      json.partial! 'user', user: @user_calendar_training.user
    end
  end

end

json.jsonapi do
  json.version "1.0"
end
