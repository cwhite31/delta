class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  # GET /contacts or /contacts.json
  def index
    # Initialize filterrific
    @contacts = Contact.paginate(page: params[:page]).order(qso_date: :desc)
# @contacts = Contact.order(qso_date: :desc).first(10)
  end

  # GET /contacts/1 or /contacts/1.json
  def show
    @contacts = Contact.where(callsign: @contact.callsign).order(qso_date: :desc)
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_url(@contact), notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contact_url(@contact), notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy!

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def load
    uploaded_file = params[:adi_file]

    if uploaded_file.present?
      Contact.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!("contacts")
      records =  Array.new
      field = Array.new
      fields =  Array.new

      File.foreach(uploaded_file) do |line|
        unless line.match(/[^<]*<eor>[^<]*/i)
          field[0] = line[1..line.index(':').to_i]
          field[1] = line[(line.index('>')).to_i+1..-1].chomp
          fields << field
          field = Array.new
        else
          records << fields
          fields = Array.new
        end
        end
        # ap records
        records.each do |record|
          contact = Contact.new
      contact.callsign = record.to_h["Call:"]
      puts record.to_h["."]
      contact.qso_date = record.to_h["QSO_Date:"]
      if record.to_h["Time_On:"]
        contact.time_on = record.to_h["Time_On:"]
        contact.started_at = record.to_h["QSO_Date:"] + " " + record.to_h["Time_On:"][0..1] + ":" + record.to_h["Time_On:"][2..3]+ ":" + record.to_h["Time_On:"][4..5]
      else
        contact.started_at = record.to_h["QSO_Date:"]
      end
      
      if record.to_h["Time_Off:"]
        contact.time_off = record.to_h["Time_Off:"]
        contact.ended_at = record.to_h["QSO_Date:"] + " " + record.to_h["Time_Off:"][0..1] + ":" + record.to_h["Time_Off:"][2..3]+ ":" + record.to_h["Time_Off:"][4..5]
      else
        contact.ended_at = record.to_h["QSO_Date:"]
      end
      
      contact.band = record.to_h["Band:"]
      contact.continent = record.to_h["Cont:"]
      contact.county = record.to_h["Cnty:"]
      contact.state = record.to_h["State:"]
      contact.country = record.to_h["Country:"]
      contact.dxcc_id = record.to_h["DXCC:"]
      contact.cq_zone = record.to_h["CQz:"]
      contact.itu_zone = record.to_h["ITUz:"]
      contact.frequency = record.to_h["Freq:"]
      contact.gridsquare = record.to_h["Gridsquare:"]
      contact.station_gridsquare = record.to_h["My_Gridsquare:"]
      contact.mode = record.to_h["Mode:"]
      contact.operator_name = record.to_h["Operator:"]
      contact.prefix = record.to_h["Prefix:"]
      contact.signal_report_received = record.to_h["RST_Rcvd:"]
      contact.signal_report_sent = record.to_h["RST_Sent:"]
      if record.to_h["QSL_Rcvd:"] == "Y"
        contact.qsl_received = record.to_h["QSL_Rcvd:"] = true
      end
      contact.lotw_qsl_received = record.to_h["QSL_Rcvd:"]
      if record.to_h["QSL_Sent:"] == "Y"
        contact.qsl_sent = record.to_h["QSL_Sent:"] = true
      end
      contact.lotw_qsl_sent = record.to_h["QSL_Sent:"]
      contact.qsl_confirmed_by = record.to_h["N3FJP_QSLSCB:"]
      contact.comments = record.to_h["Comment:"]
      contact.power = record.to_h["TX_PWR:"]
      
      contact.save!
      
      ap contact.dxcc_id
      ap contact.band
      
      
      
      if contact.dxcc_id && contact.dxcc_id != 0
        @country = Country.where( dxcc_id: contact.dxcc_id ).first
        @country[contact.band.downcase] = true
        @country.worked = true
        if contact.qsl_received
          @country.confirmed = true
        end
        @country.save!
      end
    end
  end
      
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.fetch(:contact, {})
    end
end
