class TripDecorator < Draper::Decorator
  delegate_all

    def created_at
      helpers.content_tag :span, class: 'time' do
        trip.created_at.strftime("%d/%m/%Y - %H:%M")
      end
    end

end
