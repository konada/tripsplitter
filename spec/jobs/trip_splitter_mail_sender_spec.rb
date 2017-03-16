require "rails_helper"

RSpec.describe TripSplitterMailSender do
  include ActiveJob::TestHelper

  describe '#perform' do
    it 'sends an email' do
      expect do
        perform_enqueued_jobs do
          FactoryGirl.create(:trip)
        end
      end.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
