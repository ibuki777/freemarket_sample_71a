FactoryBot.define do
  require "faker"
  factory :user do
    password              {Faker::Internet.password(min_length: 7)}
    nickname              {Faker::Creature::Animal.name}
    email                 {Faker::Internet.email(domain: 'example')}
    last_name             {"あべ"}
    first_name            {"ひろし"}
    last_name_kana        {"あべ"}
    first_name_kana       {"ひろし"}
    birthday              {"1990-06-06"}
    trait :password_confirmation do
      after(:build) {|user| user.password_confirmation << build(:password_confirmation, user: user)}
    end

  
  end
end



