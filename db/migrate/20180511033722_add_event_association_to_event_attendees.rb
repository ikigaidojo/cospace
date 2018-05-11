class AddEventAssociationToEventAttendees < ActiveRecord::Migration[5.1]
  def change
    add_reference :event_attendees, :event, foreign_key: true
  end
end
