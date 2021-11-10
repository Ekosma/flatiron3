class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.string :assignment_name
      t.integer :grade
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :period, null: false, foreign_key: true

      t.timestamps
    end
  end
end
