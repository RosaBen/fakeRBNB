class Reservation < ApplicationRecord
  validates :start_time, :end_time, presence: true, uniqueness: true
  validate :start_time_before_end_time
  validate :start_time_not_in_past
  validate :end_time_not_in_past
  validate :not_overlapping_dates

  def start_time_before_end_time
    if start_time >= end_time
      errors.add(:start_time, "la date de début doit être antérieure à la date de fin")
    end
  end

  def start_time_not_in_past
    if start_time < Time.now
      errors.add(:start_time, "la date de début ne doit pas être dans le passé")
    end
  end

  def end_time_not_in_past
    if end_time <= Time.now
      errors.add(:end_time, "la date de fin doit se trouver dans le futur")
    end
  end

  def not_overlapping_dates
    Reservation.all.each do |reservation|
      next if reservation.id == id

      if start_time < reservation.end_time && end_time > reservation.start_time
        errors.add(:base, "Cette réservation chevauche une autre réservation existante")
        break
      end
    end
  end
end
