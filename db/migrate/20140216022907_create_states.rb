class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
    	t.string :state_name,:null => false
  		t.belongs_to :country, :null => false
    end
  end
end
