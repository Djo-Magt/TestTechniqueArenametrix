require 'csv'

class ReservationsController < ApplicationController
  def import
    file = params[:file]
    if file.nil?
      return redirect_to reservations_path, notice: "Pas de fichier"
    else
      return redirect_to reservations_path, notice: "Seulement CSV" unless file.content_type == "text/csv"
    end

    @filename = file.original_filename

    Reservation.destroy_all

    csv_data = file.read
    csv = CSV.parse(csv_data, headers: :first_row, col_sep: ';')
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
      Reservation.create(reservation_hash)
    end
    flash[:filename] = @filename
    redirect_to analyse_reservations_path
  end

  def analyse
    @reservations = filter_reservations(params)
    @nombre_de_resa = @reservations.count
    @acheteurs_unique = @reservations.distinct.pluck(:email).count
    @age_moyen = @reservations.average(:age).to_i
    @prix_moyen = @reservations.average(:prix).round(2)

    @filename = flash[:filename]
  end

  def filter_reservations(params)
    reservations = Reservation.all
    if params[:spectacle].present?
      reservations = reservations.where(spectacle: params[:spectacle])
    end
    reservations
  end

end
