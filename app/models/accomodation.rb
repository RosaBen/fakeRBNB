class Accomodation < ApplicationRecord
  validates :available_beds,
  presence: true,
  numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :price,
  presence: true,
  numericality: { greater_than_or_equal_to: 0 }

  validates :description,
  presence: true,
  length: { minimum: 140 }

  validates :welcome_message,
  presence: true
end
