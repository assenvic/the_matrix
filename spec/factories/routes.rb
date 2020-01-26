FactoryBot.define do
  factory :route do
    start_time { rand(2.days).seconds.ago  }
    end_time { rand(2.days).seconds.from_now }
    start_node { AlphanumericCode::CODES.values[rand(0..8)] }
    end_node { AlphanumericCode::CODES.values[rand(0..8)] }
  end
end
