class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string     :first_name
      t.string     :last_name
      t.string     :phone_number
      t.string     :gender
      t.string     :password
      t.string     :email, default: "", null: false
      t.string     :encrypted_password, default: "", null: false
      t.string     :reset_password_token
      t.datetime   :reset_password_sent_at
      t.datetime   :remember_created_at
      t.integer    :sign_in_count, default: 0, null: false
      t.datetime   :current_sign_in_at
      t.datetime   :last_sign_in_at
      t.inet       :current_sign_in_ip
      t.inet       :last_sign_in_ip
      t.string     :confirmation_token
      t.datetime   :confirmed_at
      t.datetime   :confirmation_sent_at
      t.string     :unconfirmed_email
      t.references :membership_type
      
      t.timestamp
    end
  end
end
