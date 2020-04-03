FactoryBot.define do
  require "faker"
  
  factory :product do
    id             {1} 
    name           {Faker::Creature::Animal.name}
    explain        {Faker::Movies::HarryPotter.quote}
    price          {rand(300..1000000)}
    category_id    {rand(1..13)}
    condition_id   {rand(1..6)}
    burden_id      {rand(1..2)}
    prefecture_id  {rand(1..47)}
    deliveryday_id {rand(1..3)}
  end

end