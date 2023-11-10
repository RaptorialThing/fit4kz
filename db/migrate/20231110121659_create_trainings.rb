class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.belongs_to :user
      t.belongs_to :program
      t.string :video_link
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
