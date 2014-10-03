class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t| 
    	t.string "user_name", :limit => 20
    	t.string "email", :limit => 30
    	t.string "phone" 
    	t.string "password_digest", :limit => 30

      t.timestamps
    end
  end
end
