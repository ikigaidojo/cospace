module CalendarsHelper

  def generate_avaliable_rooms(date) 
    spare_rooms = []
    
    Room.all.each do |room|
      room_booked = room.room_bookings.where(date_booked: DateTime.parse(date))
      if room_booked.empty? 
        spare_rooms << room.name
      end
    end


    # build the html using ruby strings
    html = '<div id = "available_rooms" >
              <div class="row">'


######################## ----- list of rooms  ----- ########################
        # adds div classes for the LIST of rooms
        html.concat('<div class="col-4">
                      <div class="list-group" id="list-tab" role="tablist">')
        
        # create list of room names. 
        spare_rooms.each do |room_name|
          html.concat(
            '<a 
              class = "list-group-item list-group-item-action" 
              id="list-' +room_name+ '-list" 
              data-toggle="list" href="#list-' +room_name+ '" role="tab" 
              aria-controls="' +room_name+ '">' +room_name+  
            '</a>')
        end
        # end divs for list divs
        html.concat('</div> </div>')


######################## ----- descriptions  ----- ########################
        # create divs for descriptoins
        html.concat('<div class="col-8">
                      <div class="tab-content" id="nav-tabContent">')
        
        # create descriptions of rooms. 
        spare_rooms.each do |room_name|
          html.concat('<div 
              class="tab-pane fade " 
              id="list-'+room_name+'" 
              role="tabpanel" aria-labelledby="list-'+room_name+'-list"> 
              <h1>' +room_name+' </h1>
              <p>' +room_name+' is a cozy room nested in the back of launchgarage  
              <br>
              It was named after the starwars planet, '+room_name+'
              <br></p>
              
            </div>') 
        end

        # # some placeholder content for descrption
        # html.concat('<p> 
        #   this is the description this is the description 
        #   this is the description this is the description 
        #   this is the description this is the description 
        #   </p>')

        #end divs for descriptions
        html.concat('</div> </div>')


    # end divs for "available_rooms" and "row"
    html.concat('</div></div>') 

    return html.html_safe 
  end #function end




end #helper end
