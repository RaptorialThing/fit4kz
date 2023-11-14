# == Schema Information
#
# Table name: trainings
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  program_id  :bigint
#  video_link  :string
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_trainings_on_program_id  (program_id)
#  index_trainings_on_user_id     (user_id)
#
FactoryBot.define do
  factory :training do
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    video_link { Faker::Internet.url }
    user
    program
  end
end
