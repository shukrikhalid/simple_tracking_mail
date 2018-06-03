class MailsController < ApplicationController
  before_action :set_mail, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  # GET /mails
  # GET /mails.json
  def index
    @search = ""
    @mails = Mail.all
    if params.has_key?("search") && !params[:search].blank?
      @mails = @mails.joins("INNER JOIN staffs ON staffs.id = mails.recipient_id AND staffs.name  like '%#{params[:search]}%'
                              OR mail_no like '%#{params[:search]}%'").distinct
      #.where("mail_no like ?", "%#{params[:search]}%" )
      @search = params[:search]
    end
    if params.has_key?("status") && !params[:status].blank?
      status_id = params[:status].to_i
      # @mails = @mails.joins("INNER JOIN mail_histories ON mail_histories.mail_id = mails.id")
      #                 .joins("INNER JOIN status_deliveries ON status_deliveries.id = mail_histories.status_delivery_id AND  
      #                        status_deliveries.id = #{status_id}").distinct
      mail_id = []
      @mails.each do |mail|
        if mail.mail_histories.last.status_delivery_id == status_id
          mail_id.push(mail.id)
        end
      end
      # if mail_id.join(",") == ""
      #   mail_id = "null"
      # else
      #   mail_id = mail_id.join(",")
      # end

      mail_id = mail_id.join(",").blank? ? "null" : mail_id.join(",")
      
      @mails = Mail.where("id in (#{mail_id})")
    end
  end

  # GET /mails/1mail_id
  # GET /mails/1.json
  def show
  end

  # GET /mails/new
  def new
    @mail = Mail.new
  end

  # GET /mails/1/edit
  def edit
  end

  # POST /mails
  # POST /mails.json
  def create
    @mail = Mail.new(mail_params)

    respond_to do |format|
      if @mail.save
         @mail_history = @mail.mail_histories.new
         @mail_history.status_delivery_id = 1
         @mail_history.staff_id = 3
         @mail_history.save!
         
        format.html { redirect_to @mail, notice: 'Mail was successfully created.' }
        format.json { render :show, status: :created, location: @mail }
      else
        format.html { render :new }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mails/1
  # PATCH/PUT /mails/1.json
  def update
    respond_to do |format|
      if @mail.update(mail_params)
        format.html { redirect_to @mail, notice: 'Mail was successfully updated.' }
        format.json { render :show, status: :ok, location: @mail }
      else
        format.html { render :edit }
        format.json { render json: @mail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mails/1
  # DELETE /mails/1.json
  def destroy
    @mail.destroy
    respond_to do |format|
      format.html { redirect_to mails_url, notice: 'Mail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail
      @mail = Mail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_params
      params.require(:mail).permit(:mail_no, :issue_id, :recipient_id)
    end
end
