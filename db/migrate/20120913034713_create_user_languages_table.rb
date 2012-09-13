class CreateUserLanguagesTable < ActiveRecord::Migration
  def up
  	create_table :languages_users, :id => false do |t|
  		t.integer :language_id
  		t.integer :user_id
  	end
  end

  def down
  	drop_table :languages_users
  end
end
