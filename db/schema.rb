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

ActiveRecord::Schema.define(:version => 20121106235918) do

  create_table "encuestas", :force => true do |t|
    t.string   "nombre"
    t.date     "fecha_inicio"
    t.date     "fecha_fin"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "preguntas", :force => true do |t|
    t.integer  "encuesta_id"
    t.text     "descripcion"
    t.integer  "tipo_pregunta_id"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "preguntas", ["encuesta_id"], :name => "index_preguntas_on_encuesta_id"
  add_index "preguntas", ["position"], :name => "index_preguntas_on_position"
  add_index "preguntas", ["tipo_pregunta_id"], :name => "index_preguntas_on_tipo_pregunta_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "rutas", :force => true do |t|
    t.string   "nombre"
    t.date     "fecha_inicio"
    t.date     "fecha_final"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

  create_table "usuarios_roles", :id => false, :force => true do |t|
    t.integer "usuario_id"
    t.integer "role_id"
  end

  add_index "usuarios_roles", ["usuario_id", "role_id"], :name => "index_usuarios_roles_on_usuario_id_and_role_id"

end
