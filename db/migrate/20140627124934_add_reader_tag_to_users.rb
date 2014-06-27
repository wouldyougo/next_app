class AddReaderTagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reader, :boolean, default: false
  end
end
