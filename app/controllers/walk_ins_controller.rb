class WalkInsController < ApplicationController
  before_action :authenticate_member!
  before_action :authenticate

  def authenticate
    unless current_member.is_admin == true
      allo
      redirect_to calendar_calendars_path, notice: "admin page not permitted"
    end
  end

  def index
    @walk_in = new_member
  end

  def add_walk_in_member
    unless current_member.is_admin == true
    redirect_to member_session_path
  end
end
