require 'csv'

class ReservationsController < ApplicationController

  def create
    file_key = params[:file_key]
    file_id = params[:file_id]
    cloudinary_file = Cloudinary::Downloader.download("https://res.cloudinary.com/dsyc05bkd/raw/upload/v1715783452/development/#{file_key}")
    csv_data = cloudinary_file.force_encoding('UTF-8')
    csv = CSV.parse(csv_data, headers: :first_row, col_sep: ';')
    pars_csv(csv, file_id)

    redirect_to reservations_path
  end


  def show
    @reservations = Reservation.all
    @nombre_de_resa = @reservations.count
    @acheteurs_unique = @reservations.distinct.pluck(:email).count
    @age_moyen = @reservations.average(:age).to_i
    @prix_moyen = @reservations.average(:prix).round(2)
    @filename = flash[:filename]
  end

  def filter_reservations
    # reservations = Reservation.all
    # if params[:new_file_id].present?
    #   reservations = reservations.where(file_item_id: params[:new_file_id])
    # end
    # reservations
  end


  private
  def pars_csv(csv, file_id)
    csv.each do |row|
      reservation_hash = {}
      reservation_hash[:numero_billet] = row["Numero billet"]
      reservation_hash[:numero_reservation] = row["Reservation"]
      reservation_hash[:date_reservation] = row["Date reservation"]
      reservation_hash[:heure_reservation] = row["Heure reservation"]
      reservation_hash[:cle_spectacle] = row["Cle spectacle"]
      reservation_hash[:spectacle] = row["Spectacle"]
      reservation_hash[:cle_representation] = row["Cle representation"]
      reservation_hash[:representation] = row["Representation"]
      reservation_hash[:date_representation] = row["Date representation"]
      reservation_hash[:heure_representation] = row["Heure representation"]
      reservation_hash[:date_fin] = row["Date fin representation"]
      reservation_hash[:heure_fin] = row["Heure fin representation"]
      reservation_hash[:prix] = row["Prix"]
      reservation_hash[:type_de_produit] = row["Type de produit"]
      reservation_hash[:filiere] = row["Filiere de vente"]
      reservation_hash[:nom] = row["Nom"]
      reservation_hash[:prenom] = row["Prenom"]
      reservation_hash[:email] = row["Email"]
      reservation_hash[:adresse] = row["Adresse"]
      reservation_hash[:code_postal] = row["Code postal"]
      reservation_hash[:pays] = row["Pays"]
      reservation_hash[:age] = row["Age"]
      reservation_hash[:sexe] = row["Sexe"]
      reservation_hash[:file_item_id] = file_id
      Reservation.create(reservation_hash)
    end
  end

end
