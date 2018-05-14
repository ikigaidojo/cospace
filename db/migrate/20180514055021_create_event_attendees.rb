class CreateEventAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table   :event_attendees do |t|
      t.references :event
      t.references :member
      
      t.timestamp
    end
  end
end
