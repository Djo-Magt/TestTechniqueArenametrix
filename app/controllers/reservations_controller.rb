class ReservationsController < ApplicationController
  def import
    return redirect_to reservations_path, notice: "Seulement CSV" unless params[:file].content_type == "text/csv"

    redirect_to reservations_path, notice: "fichier importé"
  end

  def index
    @reservations = Reservation.all
  end

end
