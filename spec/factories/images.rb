FactoryBot.define do
  factory :image do
    image    {File.open("#{Rails.root}/public/images/material/pict/pict-reason-01.jpg")}
    # product
  end
end
