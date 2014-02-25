class AddStateAbbToStates < ActiveRecord::Migration
  def change
    add_column :states, :state_abb, :string
  end
end
