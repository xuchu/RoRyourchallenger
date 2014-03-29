class RemoveWebsiteAndBioFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :website, :string
    remove_column :users, :bio, :string
  end
end
