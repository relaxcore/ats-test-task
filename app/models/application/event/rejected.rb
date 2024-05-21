# frozen_string_literal: true

class Application
  class Event
    class Rejected < Application::Event
      def status
        REJECTED_STATUS
      end
    end
  end
end
