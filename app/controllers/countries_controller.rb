class CountriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_country, only: %i[ show edit update destroy ]
  def index
    @countries = Country.all.order(:name)
    @slots = Contact.select('distinct dxcc_id, band').where("country is not null")
    @slots_confirmed = Contact.select('distinct dxcc_id, band').where('qsl_received = ?', true).where("country is not null")
    
  end

  def show
    # @country = Country.where('name = ?', params[:id]).first
    @contacts = Contact.where('dxcc_id = ?', params[:id]).order(qso_date: :desc).paginate(page: params[:page], per_page: 15)
    @bands = Contact.group(:band).where('dxcc_id = ?', params[:id]).count
    @prefixes = Contact.where('dxcc_id = ?',params[:id]).select('DISTINCT prefix').order(:prefix)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find_by dxcc_id: (params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.fetch(:contact, {})
    end
end
