# frozen_string_literal: true

class LeadersController < AuthenticationController
  before_action :set_leader, only: %i[show edit update destroy]

  # GET /leaders or /leaders.json
  def index
    @leaders = Leader.includes(:user_information, :patner).all.page(params[:page]).per(params[:per_page])
  end

  # GET /leaders/1 or /leaders/1.json
  def show; end

  # GET /leaders/new
  def new
    @leader = Leader.new
  end

  # GET /leaders/1/edit
  def edit; end

  # POST /leaders or /leaders.json
  def create
    @leader = Leader.new(leader_params)

    respond_to do |format|
      if @leader.save
        format.html { redirect_to leader_url(@leader), notice: 'Leader was successfully created.' }
        format.json { render :show, status: :created, location: @leader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leaders/1 or /leaders/1.json
  def update
    respond_to do |format|
      if @leader.update(leader_params)
        format.html { redirect_to leader_url(@leader), notice: 'Leader was successfully updated.' }
        format.json { render :show, status: :ok, location: @leader }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leaders/1 or /leaders/1.json
  def destroy
    @leader.destroy!

    respond_to do |format|
      format.html { redirect_to leaders_url, notice: 'Leader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_leader
    @leader = Leader.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def leader_params
    params.require(:leader).permit(:email, :password, :password_confirmation,
                                   user_information_attributes: [:id, :full_name, :phone_number],
                                   user_patner_attributes: :patner_id)
    # params.fetch(:leader, {})
  end
end
