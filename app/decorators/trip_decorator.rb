class TripDecorator < Draper::Decorator
  delegate_all

  def created_at
    h.content_tag(:time, object.created_at.strftime("%d/%m/%Y - %H:%M:%S"))
  end
end
