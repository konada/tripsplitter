require 'rails_helper'

RSpec.describe TripCostMailer do
  let(:trip) { FactoryGirl.create(:trip) }
  let(:message) { ActionMailer::Base.deliveries.last }

  describe '#send_email' do
    before do
      ActionMailer::Base.deliveries = []
      described_class.send_email(trip).deliver_now
    end

    it 'renders the subject' do
      expect(message.subject).to eq(I18n.t('.subject'))
    end

    it 'renders the receiver email' do
      expect(message.to).to eq([trip.email])
    end

    it 'renders the sender email' do
      expect(message.from).to eq(['trip@tripsplitt.er'])
    end
  end
end
