# frozen_string_literal: true

class Job < ApplicationRecord
  has_many :events, dependent: :restrict_with_error
end
