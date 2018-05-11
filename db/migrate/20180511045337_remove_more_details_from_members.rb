class RemoveMoreDetailsFromMembers < ActiveRecord::Migration[5.1]
  change_table :members do |t|
    t.remove :time_created
    t.remove :reset_password_sent_at
    t.remove :remember_created_at
    t.remove :sign_in_count
    t.remove :current_sign_in_at
    t.remove :last_sign_in_at
    t.remove :current_sign_in_ip
    t.remove :last_sign_in_ip
  end
end
