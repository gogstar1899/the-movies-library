# frozen_string_literal: true

# This class is for Actor modals
class Actor < ActiveRecord::Base
  has_many :movies

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 },
                   format: { with: /\A[a-zA-Z\s]*\z/, message: 'only allows letters and spaces' }
  validates :oscar, inclusion: { in: [true, false] }

  validate :birthdate_format
  validates :birthdate, presence: true

  def birthdate_format
    errors.add(:birthdate, 'must be a valid date') unless birthdate.is_a?(Date)
    errors.add(:birthdate, 'cannot be in the future') if birthdate > Date.today
  end
end
