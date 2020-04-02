FactoryBot.define do
  
  factory :image do
    images   {File.open("#{Rails.root}/public/images/material/icon/icon_category.png")}
  end

end