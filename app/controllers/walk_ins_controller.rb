class WalkInsController < ApplicationController
  before_action :authenticate_member!
  before_action :authenticate

  def authenticate
    unless current_member.is_admin == true
      redirect_to calendar_calendars_path, notice: "admin page not permitted"
    end
  end

  def index
  end

  def walkin_member
    @walkin_member = new_member
    unless current_member.is_admin == true
      redirect_to walkins_path
    end
  end
end
