class SettingsController < ApplicationController
  before_action :authenticate_member!

  def index
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update_password
    @member = current_member
    if @member.update(member_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@member)
      redirect_to root_path
    else
      render "index"
    end
  end
 
 private

  def member_params
    # NOTE: Using `strong_parameters` gem
    params.require(:member).permit(:password, :password_confirmation)
  end
end