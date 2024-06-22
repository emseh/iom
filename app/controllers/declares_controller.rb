# frozen_string_literal: true

class DeclaresController < AuthenticationController
  before_action :set_declare, only: %i[show edit update destroy]

  # GET /declares or /declares.json
  def index
    @declares = Declare.all.page(params[:page]).per(params[:per_page])
  end

  # GET /declares/1 or /declares/1.json
  def show; end

  # GET /declares/new
  def new
    @declare = Declare.new
  end

  # GET /declares/1/edit
  def edit; end

  # POST /declares or /declares.json
  def create
    @declare = Declare.new(declare_params)
    @declare.user_id = current_user.id

    respond_to do |format|
      if @declare.save
        format.html { redirect_to declare_url(@declare), notice: 'Declare was successfully created.' }
        format.json { render :show, status: :created, location: @declare }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @declare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /declares/1 or /declares/1.json
  def update
    respond_to do |format|
      if @declare.update(declare_params)
        format.html { redirect_to declare_url(@declare), notice: 'Declare was successfully updated.' }
        format.json { render :show, status: :ok, location: @declare }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @declare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /declares/1 or /declares/1.json
  def destroy
    @declare.destroy!

    respond_to do |format|
      format.html { redirect_to declares_url, notice: 'Declare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_declare
    @declare = Declare.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def declare_params
    params.require(:declare).permit(:user_id, :declare_category_id, :status, :description)
  end
end
