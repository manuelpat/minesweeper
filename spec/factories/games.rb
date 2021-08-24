FactoryBot.define do
  factory :game do
    num_row { 1 }
    num_column { 1 }
    num_mine { 1 }
    is_active { false }
  end
end
