# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130221225318) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "courses", ["user_id"], :name => "index_courses_on_user_id"

  create_table "questions", :force => true do |t|
    t.integer  "ta_test_id"
    t.text     "question"
    t.string   "question_type"
    t.text     "answer"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "questions", ["ta_test_id"], :name => "index_questions_on_ta_test_id"

  create_table "ta_tests", :force => true do |t|
    t.integer  "course_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ta_tests", ["course_id"], :name => "index_ta_tests_on_course_id"

  create_table "users", :force => true do |t|
    t.string   "email",          :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "password_hash",  :null => false
    t.string   "password_salt",  :null => false
    t.datetime "first_login_at"
    t.datetime "last_login_at"
    t.string   "type"
  end

end
