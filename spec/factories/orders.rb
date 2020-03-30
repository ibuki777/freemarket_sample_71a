FactoryBot.define do
  factory :order do
    shipping_address { "MyString" }
    product { nil }
    user { nil }
  end
end
