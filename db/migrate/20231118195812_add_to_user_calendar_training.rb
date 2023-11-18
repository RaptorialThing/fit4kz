class AddToUserCalendarTraining < ActiveRecord::Migration[7.0]
  def change
    add_column :user_calendar_trainings, :icube_rule, :string
    add_column :user_calendar_trainings, :last_date, :datetime
  end
end
