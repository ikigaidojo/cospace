class EvenAttendees < ActiveRecord::Migration[5.1]
  def change
    create_table   :event_attendees do |t|
      t.references :event
      t.references :member
      t.timestamp
      
      t.index [:event_id ], name: :index_event_attendees_on_event_id
      t.index [:member_id], name: :index_event_attendees_on_member_id
    end  
  end  
end    


class Events < ActiveRecord::Migration[5.1]
  def change
    create_table   :events do |t|
      t.string     :name
      t.text       :description
      t.string     :room
      t.integer    :price
      t.integer    :attendees
      t.references :member

      t.timestamp
      
      t.index [:member_id], name: :index_events_on_member_id
    end  
  end  
end    