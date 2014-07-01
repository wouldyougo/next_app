class AddIndexToOrdersReaderId < ActiveRecord::Migration
  def change
    add_index :orders, [:reader_id, :updated_at]
  end
end
