# frozen_string_literal: true

class Movie < ActiveRecord::Base
  validates :name, :year, :director, :main_actor, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 1888 }
  validates_uniqueness_of :name, case_sensitive: false
end
