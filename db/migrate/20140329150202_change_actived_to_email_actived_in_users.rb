class ChangeActivedToEmailActivedInUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :actived, :email_actived
    end
  end
end
