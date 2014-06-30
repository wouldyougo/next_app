require 'rails_helper'

RSpec.describe "orders/new", :type => :view do
  before(:each) do
    assign(:order, Order.new(
      :user_id => 1,
      :reader_id => 1,
      :order_status => "MyString",
      :abonent => "MyString",
      :address => "MyString",
      :phone => "MyString",
      :phone_mobile => "MyString",
      :inet_tariff_plan => "MyString",
      :inet_device_contract => "MyString",
      :inet_installment_plan => 1,
      :iptv_tariff_plan => "MyString",
      :iptv_device_contract => "MyString",
      :iptv_installment_plan => 1,
      :passport_series => "MyString",
      :passport_number => "MyString",
      :passport_issued_by => "MyString",
      :place_of_birth => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_reader_id[name=?]", "order[reader_id]"

      assert_select "input#order_order_status[name=?]", "order[order_status]"

      assert_select "input#order_abonent[name=?]", "order[abonent]"

      assert_select "input#order_address[name=?]", "order[address]"

      assert_select "input#order_phone[name=?]", "order[phone]"

      assert_select "input#order_phone_mobile[name=?]", "order[phone_mobile]"

      assert_select "input#order_inet_tariff_plan[name=?]", "order[inet_tariff_plan]"

      assert_select "input#order_inet_device_contract[name=?]", "order[inet_device_contract]"

      assert_select "input#order_inet_installment_plan[name=?]", "order[inet_installment_plan]"

      assert_select "input#order_iptv_tariff_plan[name=?]", "order[iptv_tariff_plan]"

      assert_select "input#order_iptv_device_contract[name=?]", "order[iptv_device_contract]"

      assert_select "input#order_iptv_installment_plan[name=?]", "order[iptv_installment_plan]"

      assert_select "input#order_passport_series[name=?]", "order[passport_series]"

      assert_select "input#order_passport_number[name=?]", "order[passport_number]"

      assert_select "input#order_passport_issued_by[name=?]", "order[passport_issued_by]"

      assert_select "input#order_place_of_birth[name=?]", "order[place_of_birth]"
    end
  end
end
