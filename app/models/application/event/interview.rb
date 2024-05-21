# frozen_string_literal: true

class Application
  class Event
    class Interview < Application::Event
      jsonb_accessor :data, interview_date: :datetime
    end
  end
end
