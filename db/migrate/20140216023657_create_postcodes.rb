class CreatePostcodes < ActiveRecord::Migration
  def change
    create_table :postcodes do |t|
	  	t.integer :code, :null => false
      t.belongs_to :city, :null => false
    end
  end
end
