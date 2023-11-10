class CreateProgramFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :program_followers do |t|
      t.belongs_to :program
      t.belongs_to :user
      t.datetime :follow_date

      t.timestamps
    end
  end
end
