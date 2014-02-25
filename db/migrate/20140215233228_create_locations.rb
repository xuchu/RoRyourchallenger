class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.belongs_to :postcode
    	t.belongs_to :city, :null => false
    	t.belongs_to :state, :null => false
    	t.belongs_to :country, :null => false
      t.belongs_to :user, :null => false
    end
  end
end
