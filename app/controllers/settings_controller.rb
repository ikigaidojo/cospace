class SettingsController < ApplicationController

  before_action :authenticate_member!
  
  ACCOUNT_INFORMATION_PANEL_ACTIVE = 1
  PASSWORD_RESET_PANEL_ACTIVE      = 2
  NOTIFICATION_PANEL_ACTIVE        = 3
  PAYMENT_METHOD_PANEL_ACTIVE      = 4


  def index
    @member = current_member
    @active_panel = ACCOUNT_INFORMATION_PANEL_ACTIVE
  end

  def edit
    @member = current_member
  end

 def update_password
    @member = current_member
    if @member.update_with_password(member_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@member)
      redirect_to settings_path, notice: "Success"

      # @active_panel = PASSWORD_RESET_PANEL_ACTIVE
      # @update_password_panel = true
      # flash[:notice] = "Success"
    else
      # render "index"
      redirect_to settings_path, alert: "Fail"
      # @active_panel = PASSWORD_RESET_PANEL_ACTIVE
      # @update_password_panel = true
      # flash[:alert] = "Fail"
    end
  end

  def update_profile
puts "@DEBUG L:47"
    @member = current_member
    if @member.update(member_profile_params)
      # Sign in the user by passing validation in case their password changed
      # bypass_sign_in(@member)
      redirect_to settings_path, notice: "Success"

      # @active_panel = PASSWORD_RESET_PANEL_ACTIVE
      # @update_password_panel = true
      # flash[:notice] = "Success"
    else
      # render "index"
      puts "#{ap @member.errors}"
      redirect_to settings_path, alert: "Fail"
      # @active_panel = PASSWORD_RESET_PANEL_ACTIVE
      # @update_password_panel = true
      # flash[:alert] = "Fail"
    end
  end

  private

  def member_params
    # NOTE: Using `strong_parameters` gem
    params.require(:member).permit(:current_password, :password, :password_confirmation)
  end

  private

  def member_profile_params
    # NOTE: Using `strong_parameters` gem
    params.require(:member).permit(:first_name, :last_name, :email, :gender, :phone_number)
  end
end 

