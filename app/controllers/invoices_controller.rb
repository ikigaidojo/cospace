class InvoicesController < ApplicationController
  def index
  end

  def book_room
    date = params[:date]
    room = params[:room_id]
    member = params[:member_id]

    
    logger.info "========================================"
    logger.info "========================================"
    logger.info "logged from invoicesController book_room"
    logger.info "Date to be booked is: #{date}"
    logger.info "Room ID:              #{room}"
    logger.info "Member ID:            #{member}"
    logger.info "========================================"
    logger.info "========================================"
  end
end
