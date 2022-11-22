FactoryBot.define do
  factory :goal do
    weekly_goal { 1 }
    completed { false }
    user { nil }
    workout { nil }
  end
end
