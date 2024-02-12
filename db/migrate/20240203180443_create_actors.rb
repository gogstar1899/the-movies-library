# frozen_string_literal: true

# This class is for creating actors table
class CreateActors < ActiveRecord::Migration[7.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.date :birthdate
      t.string :description
      t.boolean :oscar, default: false
    end
  end
end
