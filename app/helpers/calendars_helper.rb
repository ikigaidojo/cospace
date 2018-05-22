module CalendarsHelper

  def generate_avaliable_rooms(date) 
    spare_rooms = []
    
    Room.all.each do |room|
      room_booked = room.room_bookings.where(date_booked: DateTime.parse(date))
      if room_booked.empty? 
        spare_rooms << room.name
      end
    end

    # build the html usings ruby strings
    html = '<div id = "available_rooms"> <ul class = "list-group">'
    # add each name to list. 
    spare_rooms.each do |room_name|
      html.concat('<li class = "list-group-item">' + room_name + ' is available </li>')
    end
    html.concat('<ul> </div>')

    #return html and convert from ruby string to proper html5 syntax
    return html.html_safe 

  end #function end

end # calendar helper end
