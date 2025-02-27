class CountriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_country, only: %i[ show edit update destroy ]
  def index
    @countries = Country.all.order(:name)
    @slots = Contact.select('distinct dxcc_id, band')
    @slots_confirmed = Contact.select('distinct dxcc_id, band').where('qsl_received = ?', true)
    
  end

  def show
    @contacts = Contact.where('country = ?', @country.name).order(qso_date: :desc)
    @bands = Contact.group(:band).where('country = ?', @country.name).count
    @prefixes = Contact.where('country = ?', @country.name).select('DISTINCT prefix').order(:prefix)
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.fetch(:contact, {})
    end
end
