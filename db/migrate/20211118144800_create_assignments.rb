class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.string :assignment_name
      t.belongs_to :period, null: false, foreign_key: true
    end
  end
end
