FactoryBot.define do
  
  factory :product do
    name           {"Tシャツ"}
    explain        {"良い状態"}
    price          {"2000"}
    category_id    {"2"}
    condition_id   {"1"}
    burden_id      {"1"}
    prefecture_id  {"1"}
    deliveryday_id {"1"}
    user
    after(:build) do |product|
      product.images << build(:image, product: product)
    end

    trait :with_image do
      after(:build) {|product| product.images << build(:image, product: product)}
    end

  end
end