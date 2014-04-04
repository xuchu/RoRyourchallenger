class ChangeNameInTableUsersNUlltrue < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.change :name, :string, :null=>true
    end
  end
end
