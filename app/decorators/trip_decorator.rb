class TripDecorator < Draper::Decorator
  include ActionView::Helpers::NumberHelper
  delegate_all

  def formatted_date(attribute_name)
    read_attribute(attribute_name).strftime("%d/%m/%Y - %H:%M:%S")
  end

  def formatted_amount(attribute_name)
    number_with_precision(read_attribute(attribute_name), precision: 2)
  end
end
