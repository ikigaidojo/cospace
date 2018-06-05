class AdminMembersController < ApplicationController
  before_action :authenticate_member!
  before_action :authenticate

  def authenticate
    unless current_member.is_admin == true
      redirect_to calendar_calendars_path, notice: "admin page not permitted"
    end
  end
  
  def index
    @members = Member.all
  end

end
