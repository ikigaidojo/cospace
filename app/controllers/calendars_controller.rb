class CalendarsController < ApplicationController
  before_action :authenticate_member!

  def show_spare 
    @this_day = params[:this_day]

    respond_to do |format|
      format.js
    end
    # sends to show_spare.js.erb instead of reloading calendar.html.erb,
    # also assigns the sent date as @this_day
  end

end
