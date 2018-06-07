class WalkInsController < ApplicationController
  before_action :authenticate_member!
  before_action :authenticate

  def authenticate
    unless current_member.is_admin == true
      redirect_to calendar_calendars_path, notice: "admin page not permitted"
    end
  end

  def index
    @member = Member.new
  end

  def send_mail
    @email_first = params[:first_name]
    @email_last = params[:last_name]
    @email_to_email = params[:email]

  end

  private
    def walkin_member_params
      params.require(:member).permit(:first_name, :last_name, :email)
    end
    
end
