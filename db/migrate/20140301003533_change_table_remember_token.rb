class ChangeTableRememberToken < ActiveRecord::Migration
  def change
  	change_table :remember_tokens do |t|
  		t.change :remember_token, :string, :null=>true
		end
  end
end
