class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.integer :numero_billet
      t.integer :numero_reservation
      t.datetime :date_reservation
      t.time :heure_reservation
      t.integer :cle_spectacle
      t.string :spectacle
      t.integer :cle_representation
      t.string :representation
      t.date :date_representation
      t.time :heure_representation
      t.date :date_fin
      t.time :heure_fin
      t.integer :prix
      t.string :type_de_produit
      t.string :filiere
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :adresse
      t.integer :code_postal
      t.string :pays
      t.integer :age
      t.string :sexe

      t.timestamps
    end
  end
end
