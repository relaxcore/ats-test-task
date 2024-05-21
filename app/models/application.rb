# frozen_string_literal: true

class Application < ApplicationRecord
  belongs_to :job

  has_many :events, dependent: :restrict_with_error
end
