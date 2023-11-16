# frozen_string_literal: true

json.data do
  json.type       "program"
  json.id         program.id.to_s
  json.title      program.title
  json.description program.description
end
