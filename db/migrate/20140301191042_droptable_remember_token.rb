class DroptableRememberToken < ActiveRecord::Migration
  def change
  	drop_table :remember_tokens
  end
end
