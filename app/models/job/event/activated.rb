# frozen_string_literal: true

class Job
  class Event
    class Activated < Job::Event
      def status
        ACTIVATED_STATUS
      end
    end
  end
end
