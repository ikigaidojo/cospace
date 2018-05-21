module CalendarsHelper

  def make_rooms_content(this_day) 
    html = ''


    html.concat('<div id="available-rooms-section">')
    html.concat('<p> This room just got replaced by ajax </p>')
    html.concat('</div>')

    return html.html_safe 
  end

end
