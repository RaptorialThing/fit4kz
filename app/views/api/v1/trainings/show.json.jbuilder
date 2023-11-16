# frozen_string_literal: true

json.data do
  json.id @training.id.to_s
  json.type "training"
  json.attributes do
    json.partial! 'info', training: @training
  end

  json.relationships do
    json.program do
      json.partial! 'program', program: @training.program
    end
    json.user do
      json.partial! 'user', user: @training.user
    end
  end

end

json.jsonapi do
  json.version "1.0"
end

