# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::ApplicationsController, type: :controller do
  describe 'GET index' do
    it 'returns all applications with active job' do
      job1 = create(:job, title: 'Test job')
      job1_activated_event = create(:job_activated_event, job: job1)
      job2 = create(:job)
      job2_deactivated_event = create(:job_deactivated_event, job: job2)
      job3 = create(:job)
      application1 = create(:application, job: job1, candidate_name: 'Test name')
      application2 = create(:application, job: job2)
      application3 = create(:application, job: job3)
      application1_notes_event1 = create(:application_note_event, application: application1)
      application1_notes_event2 = create(:application_note_event, application: application1)
      application1_interview_event1 = create(:application_interview_event, application: application1)
      application1_interview_event2 = create(:application_interview_event, application: application1, interview_date: '2024-05-05')
      application1_hired_event = create(:application_hired_event, application: application1)

      get :index

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body).to eq(
        [
          {
            'candidate_name' => 'Test name',
            'id' => application1.id,
            'job_name' => 'Test job',
            'last_interview_date' => '2024-05-05T00:00:00.000Z',
            'notes_count' => 2,
            'status' => 'hired'
          }
        ]
      )
    end
  end
end
