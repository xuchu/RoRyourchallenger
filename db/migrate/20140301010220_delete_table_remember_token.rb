class DeleteTableRememberToken < ActiveRecord::Migration
  def change
  	drop_table :remember_tokens
  end
end
