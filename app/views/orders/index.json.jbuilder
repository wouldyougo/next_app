json.array!(@orders) do |order|
  json.extract! order, :id, :user_id, :reader_id, :order_status, :contract_date, :abonent, :address, :phone, :phone_mobile, :connection_date, :inet_tariff_plan, :inet_device_contract, :inet_installment_plan, :iptv_tariff_plan, :iptv_device_contract, :iptv_installment_plan, :passport_series, :passport_number, :passport_registration_date, :passport_issued_by, :date_of_birth, :place_of_birth
  json.url order_url(order, format: :json)
end
