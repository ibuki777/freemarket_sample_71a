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
    user_id        {"1"}
    images         {/images/material/icon/icon_brand.png}
  end

end