# frozen_string_literal: true

class Application
  class Event
    class Note < Application::Event
      jsonb_accessor :data, content: :string
    end
  end
end
