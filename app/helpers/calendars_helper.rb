module CalendarsHelper

  def generate_avaliable_rooms(date) 
    spare_rooms = []
    spare_resources = []
    
    Room.all.each do |room|
      room_booked = room.room_bookings.where(date_booked: DateTime.parse(date))
      if room_booked.empty? 
        spare_rooms << [room.name, room.description, room.price, room.facilities, room.id]
      end
    end

    Resource.all.each do |resource|
      resources_booked = resource.resource_bookings.where(date_booked: DateTime.parse(date))
      if resources_booked.empty? 
        spare_resources << [resource.name, resource.price]
      end
    end

    # build the html using ruby strings
    html = '<div id = "available_rooms" >
              <div class="row">'

      ######################## ----- list of rooms  ----- ########################
      # adds div classes for the LIST of rooms
      html.concat("<div class='col-md-4'>
                    <div class='list-group' id='list-tab' role='tablist'>")

      # ----------- room section ------------
      html.concat("<h5> Select a room </h5>
                      <small> These rooms are available on #{date}</small>")
     
      # create list of room names. 
      spare_rooms.each do |room|
        room_name = room[0]
        description = room[1]
        price = room[2]
        facilities = room[3]

        html.concat(
          "<a 
            class = 'list-group-item list-group-item-action' 
            id='list-#{ room_name }-list' 
            data-toggle='list' href='#list-#{ room_name }' role='tab' 
            aria-controls='#{ room_name }'> #{ room_name }  
          </a>")
      end

# ----------- resources test section ----------
      html.concat("<h5> Select a resource </h5>
                      <small> These resources are available on #{date}</small>")
      # create list of resources
      spare_resources.each do |resource|
        resource_name = resource[0]
        resource_price = resource[1]

      

      html.concat(
          "<a class = 'list-group-item', role='tab'> 
            #{resource_name}
          </a>")
      end

      # end divs for list divs
      html.concat("</div> </div>")



      ######################## ----- descriptions  ----- ########################
      # create divs for descriptions
      html.concat("<div class='col-md-8'>
                    <div class='tab-content' id='nav-tabContent'>")
      
      # create descriptions of rooms. 
      spare_rooms.each do |room|
        room_name = room[0]
        description = room[1]
        price = Money.new(room[2], "USD").format 
        member_id = current_member.id
        facilities = room[3]
        room_id = room[4]
        resource_id = "inf a way to call it in calendar_helper, line84"
        resource_name = spare_resources[0]
        resource_price = spare_resources[1]

        html.concat("<div 
                      class='tab-pane fade' 
                      id='list-#{ room_name }' 
                      role='tabpanel' aria-labelledby='list-#{ room_name }-list'> 
                      <h1> #{ room_name } </h1>
                      <br>
                      Description: #{ description }
                      <br>
                      Facilities include: #{ facilities }
                      <br>
                      Price: $#{ price } 
                      <br></p>") 

        # "book now" that triggeres the modal
        html.concat("<br> 
                      <button type='button'
                      class='btn btn-primary' 
                      data-toggle='modal' 
                      data-target='##{room_name}Modal'>
                      Book #{room_name} 
                    </button>") 

        # create modal 
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
                            <button type='button' 
                              class='btn btn-secondary' 
                              data-dismiss='modal'
                            > Cancel </button>
                            
                            <button 
                            type='button' 
                            class='btn btn-success' 
                            value='Input Button' 
                            onclick='confirm_booking( `#{date}`, `#{room_id}`,`#{member_id}`, `#{resource_id}`)'
                            > Confirm </button>    
                          </div>

                        </div>
                      </div>
                    </div>")

        html.concat('</div>') #ending of the fade panel
      end # end of the loop that creates room descriptions

      #end divs for descriptions
      html.concat('</div> </div>')

    # end divs for "available_rooms" and "row"
    html.concat('</div> </div>') 

    #creates the confirm_booking function
    html.concat('<script>
                  function confirm_booking( date, room_id, member_id, resource_id ) {
                      $.post(`/invoices/book_room`, {
                        date: JSON.stringify(date), 
                        room_id: JSON.parse(room_id),
                        member_id: JSON.parse(member_id),
                        resource_id: JSON.stringify(resource_id)
                      });
                  } 
                </script>')
    return html.html_safe 
    
  end #function end

end #helper end
