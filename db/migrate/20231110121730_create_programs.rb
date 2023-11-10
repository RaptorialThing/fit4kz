class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.belongs_to :user
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
