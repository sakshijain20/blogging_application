# frozen_string_literal: true

class Blog < ApplicationRecord
  belongs_to :category
  belongs_to :user
end
