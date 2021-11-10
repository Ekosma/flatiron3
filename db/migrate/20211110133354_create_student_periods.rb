class CreateStudentPeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :student_periods do |t|
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :period, null: false, foreign_key: true
    end
  end
end
