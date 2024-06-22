# frozen_string_literal: true

class MemoCategoriesController < AuthenticationController
  before_action :set_memo_category, only: %i[show edit update destroy]

  # GET /memo_categories or /memo_categories.json
  def index
    @memo_categories = MemoCategory.all.page(params[:page]).per(params[:per_page])
  end

  # GET /memo_categories/1 or /memo_categories/1.json
  def show; end

  # GET /memo_categories/new
  def new
    @memo_category = MemoCategory.new
  end

  # GET /memo_categories/1/edit
  def edit; end

  # POST /memo_categories or /memo_categories.json
  def create
    @memo_category = MemoCategory.new(memo_category_params)

    respond_to do |format|
      if @memo_category.save
        format.html { redirect_to memo_category_url(@memo_category), notice: 'Memo category was successfully created.' }
        format.json { render :show, status: :created, location: @memo_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @memo_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memo_categories/1 or /memo_categories/1.json
  def update
    respond_to do |format|
      if @memo_category.update(memo_category_params)
        format.html { redirect_to memo_category_url(@memo_category), notice: 'Memo category was successfully updated.' }
        format.json { render :show, status: :ok, location: @memo_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @memo_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memo_categories/1 or /memo_categories/1.json
  def destroy
    @memo_category.destroy!

    respond_to do |format|
      format.html { redirect_to memo_categories_url, notice: 'Memo category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_memo_category
    @memo_category = MemoCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def memo_category_params
    params.require(:memo_category).permit(:name)
  end
end
