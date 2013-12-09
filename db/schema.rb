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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131204232632) do

  create_table "items", force: true do |t|
    t.integer "secao_id"
    t.integer "subsecao_id"
    t.string  "item"
    t.string  "marca"
    t.text    "descricao"
    t.float   "preco"
    t.string  "imagem"
  end

  create_table "orders", force: true do |t|
    t.integer "user_id"
    t.string  "status"
    t.date    "data"
  end

  create_table "purchases", force: true do |t|
    t.integer "order_id"
    t.integer "item_id"
    t.integer "quantidade"
  end

  create_table "secaos", force: true do |t|
    t.string "secao"
  end

  create_table "subsecaos", force: true do |t|
    t.integer "secao_id"
    t.string  "subsecao"
  end

  create_table "users", force: true do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.integer  "telefone"
    t.text     "endereco"
    t.string   "cidade"
    t.string   "estado"
    t.integer  "cep"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
