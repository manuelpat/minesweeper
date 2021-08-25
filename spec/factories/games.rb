FactoryBot.define do
  factory :game do
    num_row { 9 }
    num_column { 9 }
    num_mine { 9 }
    is_active { true }
  end
end
