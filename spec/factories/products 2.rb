FactoryBot.define do
  require "faker"
  
  factory :product do
    name           {Faker::Creature::Animal.name}
    explain        {Faker::Movies::HarryPotter.quote}
    price          {rand(300..1000000)}
    category_id    {rand(1..13)}
    condition_id   {rand(1..6)}
    burden_id      {rand(1..2)}
    prefecture_id  {rand(1..47)}
    deliveryday_id {rand(1..3)}
    created_at     { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
    after(:build) do |product|
      product.images << build(:image, product: product)
    end
    #メンターさんへ追加実装として組み込むので必要なコメントアウトです。
    # trait :with_image do
    #   after(:build) {|product| product.images << build(:image, product: product)}
    # end

  end
end