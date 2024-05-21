# frozen_string_literal: true

class Job
  class Event
    class Deactivated < Job::Event
      def status
        DEACTIVATED_STATUS
      end
    end
  end
end
