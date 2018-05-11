class RemoveDetailsFromMembers < ActiveRecord::Migration[5.1]
  change_table :members do |t|
    t.remove :membership_type_id
    t.remove :encrypted_password
    t.remove :reset_password_token  
  end
end
