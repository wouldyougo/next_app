class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :reader_id
      t.string :order_status
      t.datetime :contract_date
      t.string :abonent
      t.string :address
      t.string :phone
      t.string :phone_mobile
      t.datetime :connection_date
      t.string :inet_tariff_plan
      t.string :inet_device_contract
      t.integer :inet_installment_plan
      t.string :iptv_tariff_plan
      t.string :iptv_device_contract
      t.integer :iptv_installment_plan
      t.string :passport_series
      t.string :passport_number
      t.datetime :passport_registration_date
      t.string :passport_issued_by
      t.datetime :date_of_birth
      t.string :place_of_birth

      t.timestamps
    end
  end
end
