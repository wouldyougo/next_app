require 'rails_helper'

RSpec.describe "orders/show", :type => :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :user_id => 1,
      :reader_id => 2,
      :order_status => "Order Status",
      :abonent => "Abonent",
      :address => "Address",
      :phone => "Phone",
      :phone_mobile => "Phone Mobile",
      :inet_tariff_plan => "Inet Tariff Plan",
      :inet_device_contract => "Inet Device Contract",
      :inet_installment_plan => 3,
      :iptv_tariff_plan => "Iptv Tariff Plan",
      :iptv_device_contract => "Iptv Device Contract",
      :iptv_installment_plan => 4,
      :passport_series => "Passport Series",
      :passport_number => "Passport Number",
      :passport_issued_by => "Passport Issued By",
      :place_of_birth => "Place Of Birth"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Order Status/)
    expect(rendered).to match(/Abonent/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Phone Mobile/)
    expect(rendered).to match(/Inet Tariff Plan/)
    expect(rendered).to match(/Inet Device Contract/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Iptv Tariff Plan/)
    expect(rendered).to match(/Iptv Device Contract/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Passport Series/)
    expect(rendered).to match(/Passport Number/)
    expect(rendered).to match(/Passport Issued By/)
    expect(rendered).to match(/Place Of Birth/)
  end
end
