class InvoicesController < ApplicationController
  def index
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
        redirect_to invoices_path, notice: "Room booking successfull!"
      end

    else
      logger.info "room does not exist"
    end
  end # book_room end

  def create_pdf
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


