# frozen_string_literal: true

class DeclareCategoriesController < AuthenticationController
  before_action :set_declare_category, only: %i[show edit update destroy]

  # GET /declare_categories or /declare_categories.json
  def index
    @declare_categories = DeclareCategory.all.page(params[:page]).per(params[:per_page])
  end

  # GET /declare_categories/1 or /declare_categories/1.json
  def show; end

  # GET /declare_categories/new
  def new
    @declare_category = DeclareCategory.new
  end

  # GET /declare_categories/1/edit
  def edit; end

  # POST /declare_categories or /declare_categories.json
  def create
    @declare_category = DeclareCategory.new(declare_category_params)

    respond_to do |format|
      if @declare_category.save
        format.html { redirect_to declare_category_url(@declare_category), notice: 'Declare category was successfully created.' }
        format.json { render :show, status: :created, location: @declare_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @declare_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /declare_categories/1 or /declare_categories/1.json
  def update
    respond_to do |format|
      if @declare_category.update(declare_category_params)
        format.html { redirect_to declare_category_url(@declare_category), notice: 'Declare category was successfully updated.' }
        format.json { render :show, status: :ok, location: @declare_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @declare_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /declare_categories/1 or /declare_categories/1.json
  def destroy
    @declare_category.destroy!

    respond_to do |format|
      format.html { redirect_to declare_categories_url, notice: 'Declare category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_declare_category
    @declare_category = DeclareCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def declare_category_params
    params.require(:declare_category).permit(:name)
  end
end
