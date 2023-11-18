# frozen_string_literal: true

json.data do
  json.type         "user"
  json.uid          user.uid
  json.username     user.username
  json.first_name   user.first_name
  json.last_name    user.last_name
end
