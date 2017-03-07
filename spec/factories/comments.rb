FactoryGirl.define do
  factory :comment do
    commenter "MyString"
    body "MyText"
    product nil
  end
end
