require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :order_number => "Order Number",
        :first_name => "First Name",
        :last_name => "Last Name",
        :address => "Address",
        :city => "City",
        :zip => "Zip",
        :country => "Country",
        :phone => "Phone",
        :card_number => "Card Number",
        :name_on_card => "Name On Card",
        :mm_yy => "Mm Yy",
        :cvv => "Cvv"
      ),
      Order.create!(
        :order_number => "Order Number",
        :first_name => "First Name",
        :last_name => "Last Name",
        :address => "Address",
        :city => "City",
        :zip => "Zip",
        :country => "Country",
        :phone => "Phone",
        :card_number => "Card Number",
        :name_on_card => "Name On Card",
        :mm_yy => "Mm Yy",
        :cvv => "Cvv"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Order Number".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Card Number".to_s, :count => 2
    assert_select "tr>td", :text => "Name On Card".to_s, :count => 2
    assert_select "tr>td", :text => "Mm Yy".to_s, :count => 2
    assert_select "tr>td", :text => "Cvv".to_s, :count => 2
  end
end
