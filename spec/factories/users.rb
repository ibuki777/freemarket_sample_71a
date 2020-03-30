FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"あべ"}
    first_name            {"ひろし"}
    last_name_kana        {"あべ"}
    first_name_kana       {"ひろし"}
    birthday              {"1990-06-06"}
  end

end