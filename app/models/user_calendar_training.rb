# == Schema Information
#
# Table name: user_calendar_trainings
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  training_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  icube_rule  :string
#  last_date   :datetime
#
# Indexes
#
#  index_user_calendar_trainings_on_training_id  (training_id)
#  index_user_calendar_trainings_on_user_id      (user_id)
#
class UserCalendarTraining < ApplicationRecord
  belongs_to :user
  belongs_to :training

  validates_presence_of :training_id
end
