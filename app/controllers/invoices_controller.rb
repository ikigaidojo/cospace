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

  def book_room
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
        redirect_to invoices_index_path, notice: "#{new_room_booking.name} booked successfully!"
      else 
        redirect_to :back, notice: "#{new_room_booking.name} booking failed"
      end 

    else
      logger.info "room does not exist"
    end
  end # book_room end

  # this runs when 'invoice' button is clicked
  def create_pdf
  @booked = RoomBooking.where(id: params[:id]).first
  logger.info @booked

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


