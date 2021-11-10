class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :student_name
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
