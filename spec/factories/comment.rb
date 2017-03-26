FactoryGirl.define do
  factory :comment do
    commenter      "Dima"
    body           "MyText"
    product_id     1
    state          'true'
    user_id        222
    rate           1
  end
end 
