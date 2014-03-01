class CreateRememberTokens < ActiveRecord::Migration
  def change
    create_table :remember_tokens do |t|
			t.string :remember_token
    	t.index :remember_token
    	t.belongs_to :user, :null => false
    end
  end
end
