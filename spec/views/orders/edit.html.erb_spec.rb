require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :order_number => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :address => "MyString",
      :city => "MyString",
      :zip => "MyString",
      :country => "MyString",
      :phone => "MyString",
      :card_number => "MyString",
      :name_on_card => "MyString",
      :mm_yy => "MyString",
      :cvv => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_order_number[name=?]", "order[order_number]"

      assert_select "input#order_first_name[name=?]", "order[first_name]"

      assert_select "input#order_last_name[name=?]", "order[last_name]"

      assert_select "input#order_address[name=?]", "order[address]"

      assert_select "input#order_city[name=?]", "order[city]"

      assert_select "input#order_zip[name=?]", "order[zip]"

      assert_select "input#order_country[name=?]", "order[country]"

      assert_select "input#order_phone[name=?]", "order[phone]"

      assert_select "input#order_card_number[name=?]", "order[card_number]"

      assert_select "input#order_name_on_card[name=?]", "order[name_on_card]"

      assert_select "input#order_mm_yy[name=?]", "order[mm_yy]"

      assert_select "input#order_cvv[name=?]", "order[cvv]"
    end
  end
end
