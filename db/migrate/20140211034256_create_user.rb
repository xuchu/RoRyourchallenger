class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name, :null => false
        t.string :password_digest, :null => false
    	t.string :email, :null => false
    	t.string :website
    	t.string :bio
    	t.timestamps
    end
  end
end
