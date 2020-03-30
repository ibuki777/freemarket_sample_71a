FactoryBot.define do

  factory :address do
    last_name             {"あべ"}
    first_name            {"ひろし"}
    last_name_kana        {"あべ"}
    first_name_kana       {"ひろし"}
    zip_code              {"0000000"}
    city                  {"大阪市"}
    address               {"1-11"}
    prefecture_id         {"38"}
  end
end
