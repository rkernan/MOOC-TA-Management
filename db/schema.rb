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

ActiveRecord::Schema.define(:version => 20130418035247) do

  create_table "answer_results", :force => true do |t|
    t.boolean  "correct"
    t.boolean  "selected"
    t.integer  "question_result_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "answer_results", ["question_result_id"], :name => "index_answer_results_on_question_result_id"

  create_table "answers", :force => true do |t|
    t.integer  "question_id", :null => false
    t.boolean  "correct",     :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "content",     :null => false
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "courses", :force => true do |t|
    t.string   "name",         :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "professor_id", :null => false
  end

  create_table "question_results", :force => true do |t|
    t.boolean  "correct"
    t.integer  "test_result_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "question_results", ["test_result_id"], :name => "index_question_results_on_test_result_id"

  create_table "questions", :force => true do |t|
    t.integer  "ta_test_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "content",    :null => false
  end

  add_index "questions", ["ta_test_id"], :name => "index_questions_on_ta_test_id"

  create_table "ta_test_requests", :force => true do |t|
    t.string   "ta_email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "course_id"
  end

  create_table "ta_tests", :force => true do |t|
    t.integer  "course_id",  :null => false
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ta_tests", ["course_id"], :name => "index_ta_tests_on_course_id"

  create_table "test_results", :force => true do |t|
    t.integer  "teaching_assistant_id"
    t.integer  "ta_test_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "test_results", ["ta_test_id"], :name => "index_test_results_on_ta_test_id"
  add_index "test_results", ["teaching_assistant_id"], :name => "index_test_results_on_teaching_assistant_id"

  create_table "users", :force => true do |t|
    t.string   "email",             :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "password_hash",     :null => false
    t.string   "password_salt",     :null => false
    t.datetime "first_login_at"
    t.datetime "last_login_at"
    t.string   "type"
    t.string   "persistence_token"
  end

end
