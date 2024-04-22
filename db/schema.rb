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

ActiveRecord::Schema[7.1].define(version: 2024_04_22_175700) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: :cascade do |t|
    t.integer "numero_billet"
    t.integer "numero_reservation"
    t.datetime "date_reservation"
    t.time "heure_reservation"
    t.integer "cle_spectacle"
    t.string "spectacle"
    t.integer "cle_representation"
    t.string "representation"
    t.date "date_representation"
    t.time "heure_representation"
    t.date "date_fin"
    t.time "heure_fin"
    t.integer "prix"
    t.string "type_de_produit"
    t.string "filiere"
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "adresse"
    t.integer "code_postal"
    t.string "pays"
    t.integer "age"
    t.string "sexe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
