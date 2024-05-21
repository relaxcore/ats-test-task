# frozen_string_literal: true

class Job
  class Event < ApplicationRecord
    belongs_to :job

    def status
      raise NotImplementedError
    end

    ACTIVATED_STATUS = 'activated'
    private_constant :ACTIVATED_STATUS

    DEACTIVATED_STATUS = 'deactivated'
  end
end
