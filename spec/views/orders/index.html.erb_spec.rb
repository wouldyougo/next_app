require 'rails_helper'

RSpec.describe "orders/index", :type => :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
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
      ),
      Order.create!(
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
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Order Status".to_s, :count => 2
    assert_select "tr>td", :text => "Abonent".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Inet Tariff Plan".to_s, :count => 2
    assert_select "tr>td", :text => "Inet Device Contract".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Iptv Tariff Plan".to_s, :count => 2
    assert_select "tr>td", :text => "Iptv Device Contract".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Passport Series".to_s, :count => 2
    assert_select "tr>td", :text => "Passport Number".to_s, :count => 2
    assert_select "tr>td", :text => "Passport Issued By".to_s, :count => 2
    assert_select "tr>td", :text => "Place Of Birth".to_s, :count => 2
  end
end
