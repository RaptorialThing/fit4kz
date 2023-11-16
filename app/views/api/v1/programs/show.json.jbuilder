# frozen_string_literal: true

json.data do
  json.id @program.id.to_s
  json.type "program"
  json.attributes do
    json.partial! 'info', program: @program
  end

  json.relationships do
    json.trainings do
      json.data do
        json.array! @program.trainings  do |training|
          json.partial! 'training', training: training
        end
      end
    end
    json.user do
      json.partial! 'user', user: @program.user
    end
  end

end

json.jsonapi do
  json.version "1.0"
end

