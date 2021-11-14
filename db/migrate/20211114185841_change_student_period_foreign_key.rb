class ChangeStudentPeriodForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :student_periods, :students
    remove_foreign_key :student_periods, :periods
    add_foreign_key :student_periods, :students, on_delete: :cascade, column: :student_id
    add_foreign_key :student_periods, :periods, on_delete: :cascade, column: :period_id
  end
end
