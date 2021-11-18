class CreateGrades < ActiveRecord::Migration[6.1]
  def change
    create_table :grades do |t|
      t.integer :grade
      t.belongs_to :assignment, null: false, foreign_key: true
      t.belongs_to :student, null: false, foreign_key: true
    end
  end
end
