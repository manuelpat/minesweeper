require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
    it 'validate relations' do
      should have_many(:positions)
    end
  end
end
