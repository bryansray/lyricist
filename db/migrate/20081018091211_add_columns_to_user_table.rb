class AddColumnsToUserTable < ActiveRecord::Migration
  def self.up
    add_column :users, :statement, :string
  end

  def self.down
    remove_column :users, :statement
  end
end
