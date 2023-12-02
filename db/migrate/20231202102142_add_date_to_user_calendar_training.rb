class AddDateToUserCalendarTraining < ActiveRecord::Migration[7.0]
  def change
    add_column :user_calendar_trainings, :training_datetime, :datetime
  end
end
