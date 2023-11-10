# == Schema Information
#
# Table name: programs
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_programs_on_user_id  (user_id)
#
FactoryBot.define do
  factory :program do
    title { Faker::Music.band }
    description { Faker::Music.album }
    user
  end
end
