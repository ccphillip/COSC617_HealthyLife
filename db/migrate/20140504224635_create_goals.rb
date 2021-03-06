class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :activity_object
      t.string :name
      t.string :description
      t.date :date
      t.string :status
      t.string :priority

      t.timestamps
    end
  end
end
