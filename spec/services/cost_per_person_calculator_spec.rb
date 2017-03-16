require 'rails_helper'

RSpec.describe CostPerPersonCalculator do
  let(:trip) { FactoryGirl.create(:trip) }

  describe '#call' do
    it 'calculates trip cost per person' do
      described_class.new(trip).call
      expect(trip.cost_per_person).to eq 100
    end
  end
end
