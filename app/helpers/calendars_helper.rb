module CalendarsHelper

  def generate_avaliable_rooms(date) 
    #2d arrays containing attributes of rooms
    spare_rooms = []
    booked_rooms = []

    ugly_date = date
    date = DateTime.parse(date).strftime("%e %B %Y")

    
    Room.all.each do |room|
      room_booked = room.room_bookings.where(date_booked: ugly_date)
      if room_booked.empty? 
        spare_rooms << [room.name, room.description, room.price, room.facilities, room.id]
      else 
        booked_rooms << [room.name, room.description, room.price, room.facilities, room.id]
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
                      <small> These rooms are available on <br> #{date}</small>")
     
      # create list of room names (not booked) 
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

      # create list of BOOKED rooms names for admin
      if ((current_member.is_admin == true) && (booked_rooms.empty? != true))
        html.concat(" <br> <small>Only admin can see booked rooms</small>")
        booked_rooms.each do |room|
          room_name = room[0]
          description = room[1]
          price = room[2]
          facilities = room[3]

          html.concat(
            "<a 
            class = 'list-group-item list-group-item-action' 
            id='list-#{ room_name }-list' 
            data-toggle='list' href='#list-#{ room_name }' role='tab' 
            aria-controls='#{ room_name }'> #{ room_name } is booked
          </a>")
        end
      end
      #end div for list of unbooked rooms 
      html.concat("</div>")
      # end divs for the col-md-4 holding lists of rooms divs
      html.concat("</div>")
        

      ######################## ----- descriptions  ----- ########################
      
      # create divs for descriptions
      html.concat("<div class='col-md-8'>
                    <div class='tab-content' id='nav-tabContent'>")
      
      # create descriptions of rooms (not booked). 
      spare_rooms.each do |room|
        room_name = room[0]
        description = room[1]
        price = Money.new(room[2], "USD").format 
        member_id = current_member.id
        facilities = room[3]
        room_id = room[4]
        # resource_id = "find a way to call it in calendar_helper, line84"
        # resource_name = spare_resources[0]
        # resource_price = spare_resources[1]

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
                      Price: #{ price } 
                      <br></p>") 

        # "book now" button that triggers the modal
        html.concat("<br> 
                      <button type='button'
                      class='btn btn-primary' 
                      data-toggle='modal' 
                      data-target='##{room_name}Modal'>
                      Book #{room_name} 
                    </button>") 

        # create modal (not booked)
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
                            For #{price}
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
                            onclick='confirm_booking( `#{date}`, `#{room_id}`,`#{member_id}`)'
                            > Confirm </button>    
                          </div>

                        </div>
                      </div>
                    </div>")

          
        html.concat('</div>') #If user is not admin, it still works
      end # end of the loop that creates room descriptions

############# modal creation for admin ####################
      if current_member.is_admin == true


        # create admin descriptions of rooms. 
        booked_rooms.each do |room|
          room_name = room[0]
          description = room[1]
          price = Money.new(room[2], "USD").format 
          member_id = current_member.id
          member = Member.where(id: member_id).first
          member_name = member.first_name.capitalize
          member_last_name = member.last_name.capitalize

          if current_member.is_admin
            member_name = "admin"
            member_last_name = ""
          end
          facilities = room[3]
          room_id = room[4]
          # resource_id = "find a way to call it in calendar_helper, line84"
          # resource_name = spare_resources[0]
          # resource_price = spare_resources[1]
          html.concat("<div 
                        class='tab-pane fade' 
                        id='list-#{ room_name }' 
                        role='tabpanel' aria-labelledby='list-#{ room_name }-list'> 
                        <h3> #{ room_name } is booked by #{member_name} #{member_last_name} </h3>
                        <br>
                        Description: #{ description }
                        Facilities include: #{ facilities }
                        <br>
                        <br></p>") 

          # "book now" that triggers the modal
          html.concat("<small class> As admin, you have the option to delete booking #{member_name} made. 
                        <br> 
                        This will cancel their invoice and refund them for this booking, if necessary.</small> 
                        <br>
                        <button type='button'
                        class='btn btn-primary' 
                        data-toggle='modal' 
                        data-target='##{room_name}Modal'>
                        Delete booking
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
                              <h5 class='modal-title' id='#{room_name}ModalLabel'>Delete this booking</h5>
                              <button type='button' class='close' data-dismiss='modal' aria-label='Close'>
                                <span aria-hidden='true'>&times;</span>
                              </button>
                            </div>

                            <div class='modal-body'>
                              <br> 
                              You're deleting the #{room_name} booking
                              <br>
                              for #{date} 
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
                              class='btn btn-danger' 
                              value='Input Button' 
                              onclick='delete_booking( `#{date}`, `#{room_id}`)'
                              > Delete booking </button>    
                            </div>

                          </div>
                        </div>
                      </div>")

          html.concat('</div>') #ending of the fade panel, added to every description creation. 
        end # end of the loop that creates room descriptions

      end # end of admin conditional

      #end divs for descriptions
      html.concat('</div> </div>')

    # end divs for "available_rooms" and "row"
    html.concat('</div> </div>') 

    #creates the confirm_booking function
    html.concat('<script>
                  function confirm_booking( date, room_id, member_id) {
                      $.post(`/invoices/book_room`, {
                        date: JSON.stringify(date), 
                        room_id: JSON.parse(room_id),
                        member_id: JSON.parse(member_id),
                      });
                  } 

                  function delete_booking( date, room_id ) {
                    $.post(`/invoices/delete_booking`, {
                      date: JSON.stringify(date),
                      room_id: JSON.parse(room_id)
                      });
                  }
                </script>')
    return html.html_safe 
    
  end #function end

end #helper end
