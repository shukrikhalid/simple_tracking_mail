class MailHistoriesController < ApplicationController
  before_action :authorize
  #before_action :set_mail_history, only: [:show, :edit, :update, :destroy]

  # GET /mail_histories
  # GET /mail_histories.json
  def index
    @mail_histories = MailHistory.all
  end

  # GET /mail_histories/1
  # GET /mail_histories/1.json
  def show
  end

  # GET /mail_histories/new
  def new
    @mail_history = MailHistory.new
    @mail_id = params[:mail_id]
  end

  # GET /mail_histories/1/edit
  def edit
  end

  # POST /mail_histories
  # POST /mail_histories.json
  def create
    @mail = Mail.find(params[:mail_id])
    @mail_history = @mail.mail_histories.new(mail_history_params)
    if @mail_history.save
      #redirect_to mail_path(@mail)
      redirect_to mail_path(@mail), notice: 'Mail history was successfully updated.'
    else
      redirect_to mail_path(@mail), notice: 'Please select status!'
    end
  end

  # PATCH/PUT /mail_histories/1
  # PATCH/PUT /mail_histories/1.json
  def update
    respond_to do |format|
      if @mail_history.update(mail_history_params)
        format.html { redirect_to @mail_history, notice: 'Mail history was successfully updated.' }
        format.json { render :show, status: :ok, location: @mail_history }
      else
        format.html { render :edit }
        format.json { render json: @mail_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_histories/1
  # DELETE /mail_histories/1.json
  def destroy
    @mail = Mail.find(params[:mail_id])
    @mail_history = @mail.mail_histories.find(params[:id])
    @mail_history.destroy
    respond_to do |format|
      format.html { redirect_to mail_path(@mail.id), notice: 'Mail history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_history
      @mail_history = MailHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_history_params
      params.require(:mail_history).permit(:mail_id, :staff_id, :status_delivery_id)
    end
end
