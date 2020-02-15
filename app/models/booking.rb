class Booking < ApplicationRecord
  belongs_to :costume
  belongs_to :user
  validates :start_date, :end_date, presence: true
  validate :end_in_future
  validate :start_in_future
  validate :end_after_start

  private

  def end_in_future
    return if end_date.blank?

    if end_date < Date.today
      errors.add(:end_date, "must be in the future")
    end
  end

  def start_in_future
    return if start_date.blank?

    if start_date <= Date.today
      errors.add(:start_date, "must be in the future")
    end
  end

  def end_after_start
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
