# == Schema Information
#
# Table name: program_followers
#
#  id          :bigint           not null, primary key
#  program_id  :bigint
#  user_id     :bigint
#  follow_date :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_program_followers_on_program_id  (program_id)
#  index_program_followers_on_user_id     (user_id)
#
class ProgramFollower < ApplicationRecord
  belongs_to :user
  belongs_to :program
end
