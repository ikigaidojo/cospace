class CalendarsController < ApplicationController
  before_action :authenticate_member!

  def show_spare 
    @this_day = params[:this_day]

    respond_to do |format|
      format.js
    end
  end

end
