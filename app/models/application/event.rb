# frozen_string_literal: true

class Application
  class Event < ApplicationRecord
    belongs_to :application

    scope :interviews, -> { where(type: 'Application::Event::Interview') }
    scope :notes, -> { where(type: 'Application::Event::Note') }
    scope :excluding_notes, -> { where.not(type: 'Application::Event::Note') }

    def status
      raise NotImplementedError
    end

    APPLIED_STATUS = 'applied'

    INTERVIEW_STATUS = 'interview'
    private_constant :INTERVIEW_STATUS

    HIRED_STATUS = 'hired'
    private_constant :HIRED_STATUS

    REJECTED_STATUS = 'rejected'
    private_constant :REJECTED_STATUS
  end
end
