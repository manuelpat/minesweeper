FactoryBot.define do
  factory :position do
    x { 1 }
    y { 1 }
    has_mine { false }
    state { 1 }
    value { 1 }
    game { nil }
  end
end
