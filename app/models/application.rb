# frozen_string_literal: true

class Application < ApplicationRecord
  belongs_to :job

  has_many :events, dependent: :restrict_with_error

  scope :hired, -> { joins(:events).where(application_events: { type: Application::Event::Hired.name }) }
  scope :rejected, -> { joins(:events).where(application_events: { type: Application::Event::Rejected.name }) }
  scope :ongoing, lambda {
    where.not(
      id: Application::Event.where(
        type: [Application::Event::Hired.name, Application::Event::Rejected.name]
      ).select(:application_id)
    )
  }

  scope :with_active_job, lambda {
    joins(job: :events).joins(
      "INNER JOIN (
        SELECT job_id, MAX(created_at) AS last_event_time
        FROM job_events
        GROUP BY job_id
      ) last_events
      ON job_events.job_id = last_events.job_id AND job_events.created_at = last_events.last_event_time"
    ).where(job_events: { type: 'Job::Event::Activated' })
  }

  def status
    events.excluding_notes.last&.status || Application::Event::APPLIED_STATUS
  end
end
