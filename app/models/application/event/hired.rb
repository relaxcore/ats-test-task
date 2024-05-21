# frozen_string_literal: true

class Application
  class Event
    class Hired < Application::Event
      jsonb_accessor :data, hire_date: :datetime

      def status
        HIRED_STATUS
      end
    end
  end
end
