class AddMemberAssociationToEventAttendees < ActiveRecord::Migration[5.1]
  def change
    add_reference :event_attendees, :member, foreign_key: true
  end
end
