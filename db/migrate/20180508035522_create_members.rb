class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :phone_number
      t.string   :gender
      t.string   :password
      t.datetime :time_created
    end  
  end  
end    
