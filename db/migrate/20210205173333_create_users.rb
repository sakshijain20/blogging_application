# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.references :role, null: false, foreign_key: true
      t.integer :age
      t.integer :contact

      t.timestamps
    end
  end
end
