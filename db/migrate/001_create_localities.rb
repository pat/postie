class CreateLocalities < ActiveRecord::Migration
  def self.up
    create_table :localities do |t|
      t.column :postcode, :string, :null => false, :limit => 4
      t.column :suburb,   :string, :null => false
      t.column :state,    :string, :null => false, :limit => 3
      t.column :comments, :string, :null => false
    end
    
    add_index :localities, :postcode
    add_index :localities, :suburb
    add_index :localities, :state
  end

  def self.down
    drop_table :localities
  end
end
