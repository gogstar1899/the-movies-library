# frozen_string_literal: true

# This class is for connecting actors table to movies table
class AddActorToMovies < ActiveRecord::Migration[7.1]
  def change
    add_reference :movies, :actor, foreign_key: true
  end
end
