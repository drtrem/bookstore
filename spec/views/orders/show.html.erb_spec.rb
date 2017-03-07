require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Order Number/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Card Number/)
    expect(rendered).to match(/Name On Card/)
    expect(rendered).to match(/Mm Yy/)
    expect(rendered).to match(/Cvv/)
  end
end
