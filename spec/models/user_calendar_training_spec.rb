# == Schema Information
#
# Table name: user_calendar_trainings
#
#  id                :bigint           not null, primary key
#  user_id           :bigint           not null
#  training_id       :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  icube_rule        :string
#  last_date         :datetime
#  training_datetime :datetime
#
# Indexes
#
#  index_user_calendar_trainings_on_training_id  (training_id)
#  index_user_calendar_trainings_on_user_id      (user_id)
#
require 'rails_helper'

RSpec.describe UserCalendarTraining, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
