require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:x)
      should validate_presence_of(:y)
      should validate_presence_of(:value)
    end
  end
end
