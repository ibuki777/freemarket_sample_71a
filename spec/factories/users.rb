FactoryBot.define do
  require "faker"
  factory :user do
    password = Faker::Internet.password(min_length: 8)
    nickname              {Faker::Creature::Animal.name}
    email                 {Faker::Internet.email(domain: 'example')}
    password              {password}
    password_confirmation {password}
    last_name             {"あべ"}
    first_name            {"ひろし"}
    last_name_kana        {"あべ"}
    first_name_kana       {"ひろし"}
    birthday              {"1990-06-06"}
  
  end
end

