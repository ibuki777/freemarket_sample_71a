FactoryBot.define do
require "faker"

  factory :address do
    last_name             {"あべ"}
    first_name            {"ひろし"}
    last_name_kana        {"あべ"}
    first_name_kana       {"ひろし"}
    zip_code              {rand(0000000..9999999)}
    city                  {Faker::Address.city}
    address               {Faker::Address.street_address}
    prefecture_id         {rand(1..47)}
    user
  end

end
