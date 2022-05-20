# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_12_043957) do

  create_table "Gallery", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "image", limit: 150
    t.integer "idProduct"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["idProduct"], name: "fk_product_gallery"
  end

  create_table "carShop", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "idProduct"
    t.integer "idClient"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["idClient"], name: "fk_client_carshop"
    t.index ["idProduct"], name: "fk_product_carshop"
  end

  create_table "clientSupplier", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "idClient"
    t.integer "idSupplier"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["idClient"], name: "fk_client_clientsupplier"
    t.index ["idSupplier"], name: "fk_supplier_clientsupplier"
  end

  create_table "clients", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 150
    t.string "address", limit: 200
    t.string "phone", limit: 12
    t.string "email", limit: 100
    t.integer "userID"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["userID"], name: "fk_user_client"
  end

  create_table "orderProduct", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "idProduct"
    t.integer "idSale"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["idProduct"], name: "fk_product_orderproduct"
    t.index ["idSale"], name: "fk_sale_orderproduc"
  end

  create_table "orders", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "idClient"
    t.integer "idSale"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["idClient"], name: "fk_client_orders"
    t.index ["idSale"], name: "fk_sale_orders"
  end

  create_table "products", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "idSupplier"
    t.string "name", limit: 150
    t.float "price", limit: 53
    t.string "brand", limit: 12
    t.string "barcode", limit: 80
    t.timestamp "expirationDate"
    t.integer "qty"
    t.string "descripcion", limit: 250
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["idSupplier"], name: "fk_supplier_products"
  end

  create_table "sales", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "idClient"
    t.integer "idSupplier"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["idClient"], name: "fk_client_sales"
    t.index ["idSupplier"], name: "fk_supplier_sales"
  end

  create_table "salesProduct", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "idProduct"
    t.integer "idSale"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["idProduct"], name: "fk_product_salesproduct"
    t.index ["idSale"], name: "fk_sale_salesproduct"
  end

  create_table "suppliers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 150
    t.string "address", limit: 200
    t.string "phone", limit: 12
    t.string "email", limit: 100
    t.integer "userID"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string "imagen", null: false
    t.index ["userID"], name: "fk_user_supplier"
  end

  create_table "userType", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "type", limit: 50
    t.string "description", limit: 150
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email", limit: 100
    t.string "password_digest", limit: 250
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string "imagen", default: "https://flyclipart.com/user-icon-png-pnglogocom-user-icon-png-133466", null: false
  end

  add_foreign_key "Gallery", "products", column: "idProduct", name: "fk_product_gallery"
  add_foreign_key "carShop", "clients", column: "idClient", name: "fk_client_carshop"
  add_foreign_key "carShop", "products", column: "idProduct", name: "fk_product_carshop"
  add_foreign_key "clientSupplier", "clients", column: "idClient", name: "fk_client_clientsupplier"
  add_foreign_key "clientSupplier", "suppliers", column: "idSupplier", name: "fk_supplier_clientsupplier"
  add_foreign_key "clients", "users", column: "userID", name: "fk_user_client"
  add_foreign_key "orderProduct", "products", column: "idProduct", name: "fk_product_orderproduct"
  add_foreign_key "orderProduct", "sales", column: "idSale", name: "fk_sale_orderproduc"
  add_foreign_key "orders", "clients", column: "idClient", name: "fk_client_orders"
  add_foreign_key "orders", "sales", column: "idSale", name: "fk_sale_orders"
  add_foreign_key "products", "suppliers", column: "idSupplier", name: "fk_supplier_products"
  add_foreign_key "sales", "clients", column: "idClient", name: "fk_client_sales"
  add_foreign_key "sales", "suppliers", column: "idSupplier", name: "fk_supplier_sales"
  add_foreign_key "salesProduct", "products", column: "idProduct", name: "fk_product_salesproduct"
  add_foreign_key "salesProduct", "sales", column: "idSale", name: "fk_sale_salesproduct"
  add_foreign_key "suppliers", "users", column: "userID", name: "fk_user_supplier"
end
