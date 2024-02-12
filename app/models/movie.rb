# frozen_string_literal: true

# This class is for Movies modals
class Movie < ActiveRecord::Base
  belongs_to :actor

  validates :name, :year, :director, :main_actor, presence: true
  validates :year, numericality: { only_integer: true,
                                   greater_than: 1894,
                                   less_than_or_equal_to: Date.today.year + 5,
                                   message: 'must be a valid year' }
  validates_uniqueness_of :name, case_sensitive: false
end
