class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :goal_id
      t.integer :number
      t.string :description
      t.date :created

      t.timestamps
    end
  end
end
