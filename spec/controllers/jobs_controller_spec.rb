# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::JobsController, type: :controller do
  describe 'GET index' do
    it 'returns all jobs' do
      job1 = create(:job, title: 'Test job #1')
      job1_activated_event = create(:job_activated_event, job: job1)
      job2 = create(:job, title: 'Test job #2')
      job2_deactivated_event = create(:job_deactivated_event, job: job2)
      job3 = create(:job, title: 'Test job #3')
      job1_application1 = create(:application, job: job1)
      create(:application_interview_event, application: job1_application1)
      job1_application2 = create(:application, job: job1)
      create(:application_hired_event, application: job1_application2)
      job2_application1 = create(:application, job: job2)
      create(:application_rejected_event, application: job2_application1)
      job2_application2 = create(:application, job: job2)
      create(:application_note_event, application: job2_application2)
      job3_application1 = create(:application, job: job3)
      create(:application_interview_event, application: job3_application1)
      job3_application2 = create(:application, job: job3)
      create(:application_interview_event, application: job3_application2)

      get :index

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body).to eq(
        [
          {
            'id' => job1.id,
            'description' => 'Job Description',
            'title' => 'Test job #1',
            'status' => 'activated',
            'hired_candidates_count' => 1,
            'ongoing_candidates_count' => 1,
            'rejected_candidates_count' => 0
          },
          {
            'id' => job2.id,
            'description' => 'Job Description',
            'title' => 'Test job #2',
            'status' => 'deactivated',
            'hired_candidates_count' => 0,
            'ongoing_candidates_count' => 1,
            'rejected_candidates_count' => 1
          },
          {
            'id' => job3.id,
            'description' => 'Job Description',
            'title' => 'Test job #3',
            'status' => 'deactivated',
            'hired_candidates_count' => 0,
            'ongoing_candidates_count' => 2,
            'rejected_candidates_count' => 0
          }
        ]
      )
    end
  end
end
