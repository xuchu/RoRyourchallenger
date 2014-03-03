class AddActivedIntoUser < ActiveRecord::Migration
  def change
    add_column :users, :actived, :boolean, default: false
  end
end
