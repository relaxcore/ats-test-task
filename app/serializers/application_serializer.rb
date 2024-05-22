# frozen_string_literal: true

class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :candidate_name, :status, :job_name, :notes_count, :last_interview_date

  def job_name
    object.job.title
  end
end
