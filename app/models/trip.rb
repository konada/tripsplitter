class Trip < ApplicationRecord
  validates :tanking_cost, presence: true, if: :cost_unavailable?
  validates :trip_distance, presence: true, if: ->(trip) { trip.fuel_cost || trip.avg_consumption }
  validates :fuel_cost, presence: true, if: ->(trip) { trip.avg_consumption || trip.trip_distance }
  validates :avg_consumption, presence: true, if: ->(trip) { trip.fuel_cost || trip.trip_distance }
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, allow_blank: true

  belongs_to :user, optional: true

  before_save :calculate_cost_per_person
  after_save :send_email

  mount_uploader :invoice, InvoiceUploader
  validates_integrity_of :invoice

  def user
    super || GuestUser.new
  end

  private

  def send_email
    return true unless email.present?
    TripSplitterMailSender.perform_later(self.id)
  end

  def calculate_cost_per_person
    CostPerPersonCalculator.new(self).call
  end

  def cost_unavailable?
    trip_distance.nil? && fuel_cost.nil? && avg_consumption.nil?
  end
end
