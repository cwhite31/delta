class CountriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_country, only: %i[ edit update destroy ]
  def index
    @countries = Country.all.order(:name)
    @slots = Contact.select('distinct dxcc_id, band')
    @slots_confirmed = Contact.select('distinct dxcc_id, band').where('qsl_received = ?', true)
    
  end

  def show
    @country = Country.where('name = ?', params[:id]).first
    @contacts = Contact.where('country = ?', params[:id]).order(qso_date: :desc)
    @bands = Contact.group(:band).where('country = ?', params[:id]).count
    @prefixes = Contact.where('country = ?',params[:id]).select('DISTINCT prefix').order(:prefix)
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
