# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_14_185841) do

  create_table "assignments", force: :cascade do |t|
    t.string "assignment_name"
    t.integer "grade"
    t.integer "student_id", null: false
    t.integer "period_id", null: false
    t.index ["period_id"], name: "index_assignments_on_period_id"
    t.index ["student_id"], name: "index_assignments_on_student_id"
  end

  create_table "periods", force: :cascade do |t|
    t.string "period_name"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_periods_on_user_id"
  end

  create_table "student_periods", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "period_id", null: false
    t.index ["period_id"], name: "index_student_periods_on_period_id"
    t.index ["student_id"], name: "index_student_periods_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "student_name"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "assignments", "periods"
  add_foreign_key "assignments", "students"
  add_foreign_key "periods", "users"
  add_foreign_key "student_periods", "periods", on_delete: :cascade
  add_foreign_key "student_periods", "students", on_delete: :cascade
  add_foreign_key "students", "users"
end
