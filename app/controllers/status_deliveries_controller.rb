class StatusDeliveriesController < ApplicationController
  before_action :set_status_delivery, only: [:show, :edit, :update, :destroy]
  before_action :authorize

  # GET /status_deliveries
  # GET /status_deliveries.json
  def index
    @status_deliveries = StatusDelivery.all
  end

  # GET /status_deliveries/1
  # GET /status_deliveries/1.json
  def show
  end

  # GET /status_deliveries/new
  def new
    @status_delivery = StatusDelivery.new
  end

  # GET /status_deliveries/1/edit
  def edit
  end

  # POST /status_deliveries
  # POST /status_deliveries.json
  def create
    @status_delivery = StatusDelivery.new(status_delivery_params)

    respond_to do |format|
      if @status_delivery.save
        format.html { redirect_to @status_delivery, notice: 'Status delivery was successfully created.' }
        format.json { render :show, status: :created, location: @status_delivery }
      else
        format.html { render :new }
        format.json { render json: @status_delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_deliveries/1
  # PATCH/PUT /status_deliveries/1.json
  def update
    respond_to do |format|
      if @status_delivery.update(status_delivery_params)
        format.html { redirect_to @status_delivery, notice: 'Status delivery was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_delivery }
      else
        format.html { render :edit }
        format.json { render json: @status_delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_deliveries/1
  # DELETE /status_deliveries/1.json
  def destroy
    @status_delivery.destroy
    respond_to do |format|
      format.html { redirect_to status_deliveries_url, notice: 'Status delivery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_delivery
      @status_delivery = StatusDelivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_delivery_params
      params.require(:status_delivery).permit(:code, :name)
    end
end
