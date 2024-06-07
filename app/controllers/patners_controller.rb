# frozen_string_literal: true

class PatnersController < AuthenticationController
  before_action :set_patner, only: %i[show edit update destroy]

  # GET /patners or /patners.json
  def index
    @patners = Patner.all
  end

  # GET /patners/1 or /patners/1.json
  def show; end

  # GET /patners/new
  def new
    @patner = Patner.new
  end

  # GET /patners/1/edit
  def edit; end

  # POST /patners or /patners.json
  def create
    @patner = Patner.new(patner_params)

    respond_to do |format|
      if @patner.save
        format.html { redirect_to patner_url(@patner), notice: 'Patner was successfully created.' }
        format.json { render :show, status: :created, location: @patner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patners/1 or /patners/1.json
  def update
    respond_to do |format|
      if @patner.update(patner_params)
        format.html { redirect_to patner_url(@patner), notice: 'Patner was successfully updated.' }
        format.json { render :show, status: :ok, location: @patner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patners/1 or /patners/1.json
  def destroy
    @patner.destroy!

    respond_to do |format|
      format.html { redirect_to patners_url, notice: 'Patner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patner
    @patner = Patner.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def patner_params
    params.require(:patner).permit(:name)
  end
end
