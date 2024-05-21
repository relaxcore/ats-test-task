# frozen_string_literal: true

class Job < ApplicationRecord
  has_many :events, dependent: :restrict_with_error

  def status
    events.last&.status || Job::Event::DEACTIVATED_STATUS
  end
end
