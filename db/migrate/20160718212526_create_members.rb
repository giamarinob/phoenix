class CreateMembers < ActiveRecord::Migration[5.0]
  def change
  	create_table :members do |t|
  		t.string :email, null: false
  		t.string :name, null: false
  		t.string :password_digest, null: false
  		t.boolean :is_admin, default: false

  		t.timestamps
  	end
  end
end
