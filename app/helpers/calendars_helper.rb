module CalendarsHelper

  def generate_avaliable_rooms(date) 
    spare_rooms = []
    
    Room.all.each do |room|
      room_booked = room.room_bookings.where(date_booked: DateTime.parse(date))
      if room_booked.empty? 
        spare_rooms << [room.name, room.description, room.price]
      end
    end

    # build the html using ruby strings
    html = '<div id = "available_rooms" >
              <div class="row">'


      ######################## ----- list of rooms  ----- ########################
      # adds div classes for the LIST of rooms
      html.concat("<div class='col-4'>
                    <div class='list-group' id='list-tab' role='tablist'>
                      <h5> Select a day </h5>
                      <small> These rooms are available on #{date}</small>")

        
      # create list of room names. 
      spare_rooms.each do |room|
        room_name = room[0]
        description = room[1]
        price = room[2]

        html.concat(
          "<a 
            class = 'list-group-item list-group-item-action' 
            id='list-#{ room_name }-list' 
            data-toggle='list' href='#list-#{ room_name }' role='tab' 
            aria-controls='#{ room_name }'> #{ room_name }  
          </a>")
      end
      # end divs for list divs
      html.concat("</div> </div>")


      ######################## ----- descriptions  ----- ########################
      # create divs for descriptoins
      html.concat("<div class='col-8'>
                    <div class='tab-content' id='nav-tabContent'>")
      
      # create descriptions of rooms. 
      spare_rooms.each do |room|
        room_name = room[0]
        description = room[1]
        price = ('%.2f' % (room[2].to_i/100.0)) # or install monery gem

        html.concat("<div 
                      class='tab-pane fade' 
                      id='list-#{ room_name }' 
                      role='tabpanel' aria-labelledby='list-#{ room_name }-list'> 
                      <h1> #{ room_name } </h1>
                      <br>
                      Description: #{ description }
                      <br>
                      Price: $#{ price } 
                      <br></p>") 

        #create "book now" that pops up the modal
        html.concat("<br> 
                      <button type='button'
                      class='btn btn-primary' 
                      data-toggle='modal' 
                      data-target='##{room_name}Modal'>
                      Book #{room_name} 
                    </button>") 

        # create  modal for "book now" button
        html.concat("<div 
                      class='modal fade' 
                      id='#{room_name}Modal' 
                      tabindex='-1' role='dialog' 
                      aria-labelledby='exampleModalLabel' 
                      aria-hidden='true'>
                      <div class='modal-dialog' role='document'>
                        <div class='modal-content'>
                          <div class='modal-header'>

                            <h5 class='modal-title' id='#{room_name}ModalLabel'>Confirm your booking</h5>
                            <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                              <span aria-hidden='true'>&times;</span>
                            </button>
                          </div>
                          <div class='modal-body'>
                            <br> 
                            You're reserving #{room_name}
                            <br>
                            On Date: #{date}
                            <br>
                            For $#{price}
                            <br>
                            <br>
                          </div>
                          <div class='modal-footer'>
                            <button type='button' class='btn btn-secondary' data-dismiss='modal'>Cancel</button>
                            <button type='button' class='btn btn-success' href='#' >Confirm</button>
                          </div>
                        </div>
                      </div>
                    </div>")

        html.concat("</div>") #ending of the fade panel

        
        end
      #end divs for descriptions
      html.concat('</div> </div>')


    # end divs for "available_rooms" and "row"
    html.concat('</div> </div>') 

    return html.html_safe 
  end #function end




end #helper end
