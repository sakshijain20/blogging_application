# frozen_string_literal: true

class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.integer :readtime
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
