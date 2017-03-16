require 'rails_helper'

describe Trip do
  include ActiveJob::TestHelper

  describe '#calculate_cost_per_person' do
    context 'driver is included' do
      let(:trip) { FactoryGirl.create(:trip) }

      it { expect(trip.cost_per_person).to eq 100 }
    end

    context 'driver is not included' do
      let(:trip) { FactoryGirl.create(:trip, driver_included: false) }

      it { expect(trip.cost_per_person).to eq 0 }
    end
  end

  describe '#send_email' do
    let(:trip) { FactoryGirl.build(:trip) }

    it 'sends an email after save' do
      trip.save
      expect(TripSplitterMailSender).to have_been_enqueued
    end
  end
end
