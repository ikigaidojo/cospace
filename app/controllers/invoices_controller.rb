class InvoicesController < ApplicationController
 before_action :authenticate_member!

  def index
    @bookings = []

    RoomBooking.all.each do |booking|
      if booking.member_id == current_member.id
        @bookings << booking
      end
    end
    @bookings = @bookings.reverse
  end

  def book_room # runs when "confirm booking" button is clicked in calendar
    date      = params[:date]
    room_id   = params[:room_id].to_i
    member_id = params[:member_id]
    room = Room.where(id: room_id).first

    unless room == nil 
      new_room_booking = RoomBooking.create(
        name:        room.name, 
        description: room.description, 
        location:    room.location, 
        price:       room.price, 
        facilities:  room.facilities,
        date_booked: DateTime.parse(date),
        room_id:     room.id,
        member_id:   member_id)

      if new_room_booking.persisted?
        room.room_bookings << new_room_booking
        redirect_to invoices_path, notice: "#{new_room_booking.name} booked successfully!"
      else 
        redirect_to :back, notice: "#{new_room_booking.name} booking failed"
      end 
    else
      logger.info "room does not exist"
    end
  end # book_room end


  def delete_booking # runs when "delete booking" button is clicked in calendar
    date      = DateTime.parse(params[:date])
    room_id   = params[:room_id].to_i

    booking = RoomBooking.where("date_booked = ? AND room_id = ?", date, room_id).first
    logger.info "----------------------------------"
    logger.info booking.name
    logger.info booking.id
    logger.info booking
    logger.info "will now delete the #{booking.name} 
    booking for #{booking.date_booked}."  
    logger.info "----------------------------------"
    RoomBooking.destroy(booking.id)

    redirect_to calendar_calendars_path, notice: "#{booking.name} booking on #{date.strftime("%e %b %Y")} successfully deleted"
  end

  # this runs when 'invoice' button is clicked
  def create_pdf
  @booked = RoomBooking.where(id: params[:id]).first
  logger.info @booked

  @member = Member.where(id: @booked.member_id).first
  logger.info @member 

  @location = Location.where(id: 1).first
  logger.info @location

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Invoice",
        template: "invoices/generate_pdf.html.erb",
        layout: "pdf.html"
      end
    end
   
  end
end


