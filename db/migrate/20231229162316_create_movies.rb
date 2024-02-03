# frozen_string_literal: true

# This class is for creating movies table
class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.string :director
      t.string :main_actor
    end
  end
end
