# frozen_string_literal: true

class ProfilesController < AuthenticationController
  before_action :set_profile, only: %i[index edit update]
  before_action :set_bank_accounts, only: %i[index]
  before_action :set_bank_account, except: %i[index edit update new_bank_account create_bank_account]

  def index
    @bank_accounts = @bank_accounts.page(params[:page]).per(params[:per_page])
  end

  def edit; end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profiles_url, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_bank_account; end

  def new_bank_account
    @bank_account = BankAccount.new
  end

  def create_bank_account # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    @bank_account = BankAccount.new(bank_account_params)
    @bank_account.user_id = current_user.id

    respond_to do |format|
      if @bank_account.save
        format.html do
          redirect_to show_bank_account_profile_path(@bank_account),
          notice: 'Profile was successfully created.'
        end
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new_bank_account, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_bank_account; end

  def update_bank_account
    respond_to do |format|
      if @bank_account.update(bank_account_params)
        format.html do
          redirect_to show_bank_account_profile_path(@bank_account),
                      notice: 'Bank account was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @bank_account }
      else
        format.html { render :edit_bank_account, status: :unprocessable_entity }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_bank_account
    respond_to do |format|
      if @bank_account.destroy
        format.html { redirect_to profiles_url, notice: 'Bank account was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to profiles_url, alert: @bank_account.errors.full_messages.to_sentence }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_profile
    @profile = current_user
  end

  def set_bank_accounts
    @bank_accounts = current_user&.bank_accounts&.includes(:payout_channel)
  end

  def set_bank_account
    @bank_account = current_user.bank_accounts.includes(:payout_channel).find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:email, :password, :password_confirmation,
                                    user_information_attributes: [:id, :full_name, :phone_number])
  end

  def bank_account_params
    params.require(:bank_account).permit(:payout_channel_id, :name, :number, :active)
  end
end
