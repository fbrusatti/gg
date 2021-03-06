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

ActiveRecord::Schema.define(:version => 20131111212220) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "banks", :force => true do |t|
    t.string   "name"
    t.string   "branch_office_number"
    t.string   "address"
    t.integer  "location_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "banks", ["branch_office_number"], :name => "index_banks_on_branch_office_number"
  add_index "banks", ["name"], :name => "index_banks_on_name"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "referrer_id"
  end

  add_index "categories", ["referrer_id"], :name => "index_categories_on_referrer_id"

  create_table "categories_products", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  create_table "checks", :force => true do |t|
    t.string   "check_number"
    t.string   "account"
    t.date     "emission_date"
    t.date     "payment_date"
    t.string   "emisor"
    t.decimal  "amount",        :precision => 8, :scale => 2
    t.string   "check_status"
    t.boolean  "is_proper"
    t.integer  "bank_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "checks", ["check_number"], :name => "index_checks_on_check_number"
  add_index "checks", ["emisor"], :name => "index_checks_on_emisor"

  create_table "customers", :force => true do |t|
    t.string   "dni"
    t.string   "name"
    t.string   "surname"
    t.string   "mobile_phone"
    t.string   "phone"
    t.string   "email"
    t.string   "registered_name"
    t.string   "cuit_cuil"
    t.string   "gross_income"
    t.string   "address"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "type_person"
    t.string   "type_iva"
    t.integer  "user_id"
  end

  create_table "documents", :force => true do |t|
    t.string   "type"
    t.string   "number"
    t.decimal  "recharge",          :precision => 8, :scale => 2
    t.decimal  "amount",            :precision => 8, :scale => 2
    t.decimal  "balance",           :precision => 8, :scale => 2
    t.string   "state"
    t.date     "expiration_date"
    t.string   "payment_condition"
    t.boolean  "active"
    t.boolean  "annul"
    t.integer  "customer_id"
    t.integer  "user_id"
    t.integer  "supplier_id"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.decimal  "amount_cash",       :precision => 8, :scale => 2
    t.decimal  "amount_check",      :precision => 8, :scale => 2
    t.string   "creation_state",                                  :default => "init"
  end

  add_index "documents", ["creation_state"], :name => "index_documents_on_creation_state"
  add_index "documents", ["number"], :name => "index_documents_on_number"
  add_index "documents", ["type", "id"], :name => "index_documents_on_type_and_id"
  add_index "documents", ["type"], :name => "index_documents_on_type"

  create_table "items", :force => true do |t|
    t.integer  "document_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.decimal  "price_cost",     :precision => 8,  :scale => 2
    t.decimal  "price_sale",     :precision => 8,  :scale => 2
    t.decimal  "price_vat",      :precision => 8,  :scale => 2
    t.decimal  "price_descount", :precision => 8,  :scale => 2
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.decimal  "total_price",    :precision => 10, :scale => 2
  end

  add_index "items", ["document_id", "product_id"], :name => "index_items_on_document_id_and_product_id"
  add_index "items", ["document_id"], :name => "index_items_on_document_id"
  add_index "items", ["product_id"], :name => "index_items_on_product_id"

  create_table "locations", :force => true do |t|
    t.string   "state"
    t.string   "countri"
    t.string   "city"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "money", :force => true do |t|
    t.string   "name",                                     :null => false
    t.string   "symbol",                                   :null => false
    t.decimal  "quotation",  :precision => 8, :scale => 2, :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "description"
    t.integer  "stock"
    t.integer  "minimun_stock"
    t.float    "net_cost"
    t.float    "cost_price"
    t.string   "code"
    t.boolean  "active"
    t.string   "gondola"
    t.string   "shelf"
    t.float    "list_price_one"
    t.float    "list_price_two"
    t.float    "list_price_three"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "vat_id"
    t.integer  "money_id"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "address"
    t.string   "cuit_cuil"
    t.string   "dni"
    t.string   "email"
    t.string   "gross_income"
    t.string   "mobile_phone"
    t.string   "name"
    t.string   "phone"
    t.string   "registered_name"
    t.string   "surname"
    t.string   "type_iva"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
    t.string   "type_person"
  end

  add_index "suppliers", ["user_id"], :name => "index_suppliers_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",        :null => false
    t.string   "encrypted_password",     :default => "",        :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,         :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "name",                   :default => "User ",   :null => false
    t.string   "surname",                :default => "Default", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["surname"], :name => "index_users_on_surname"

  create_table "vats", :force => true do |t|
    t.float    "percentaje"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
