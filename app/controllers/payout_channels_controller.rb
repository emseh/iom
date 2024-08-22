# frozen_string_literal: true

class PayoutChannelsController < AuthenticationController
  before_action :set_payout_channel, only: %i[show edit update destroy]

  # GET /payout_channels or /payout_channels.json
  def index
    @payout_channels = PayoutChannel.all.page(params[:page]).per(params[:per_page])
  end

  # GET /payout_channels/1 or /payout_channels/1.json
  def show; end

  # GET /payout_channels/new
  def new
    @payout_channel = PayoutChannel.new
  end

  # GET /payout_channels/1/edit
  def edit; end

  # POST /payout_channels or /payout_channels.json
  def create
    @payout_channel = PayoutChannel.new(payout_channel_params)

    respond_to do |format|
      if @payout_channel.save
        format.html { redirect_to payout_channel_url(@payout_channel), notice: 'Payout channel was successfully created.' }
        format.json { render :show, status: :created, location: @payout_channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payout_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payout_channels/1 or /payout_channels/1.json
  def update
    respond_to do |format|
      if @payout_channel.update(payout_channel_params)
        format.html { redirect_to payout_channel_url(@payout_channel), notice: 'Payout channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @payout_channel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payout_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payout_channels/1 or /payout_channels/1.json
  def destroy
    @payout_channel.destroy!

    respond_to do |format|
      format.html { redirect_to payout_channels_url, notice: 'Payout channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payout_channel
    @payout_channel = PayoutChannel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payout_channel_params
    params.require(:payout_channel).permit(:active)
  end
end
