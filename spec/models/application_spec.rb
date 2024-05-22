require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:job) }

    it { is_expected.to have_many(:events).dependent(:restrict_with_error) }
  end

  describe 'scopes' do
    context '#hired' do
      it 'returns applications with Hired events' do
        application1 = create(:application)
        create(:application_hired_event, application: application1)
        application2 = create(:application)
        create(:application_rejected_event, application: application2)

        expect(Application.hired).to eq([application1])
      end
    end

    context '#rejected' do
      it 'returns applications with Rejected events' do
        application1 = create(:application)
        create(:application_hired_event, application: application1)
        application2 = create(:application)
        create(:application_rejected_event, application: application2)

        expect(Application.rejected).to eq([application2])
      end
    end

    context '#ongoing' do
      it 'returns applications without Hired or Rejected events' do
        application1 = create(:application)
        create(:application_hired_event, application: application1)
        application2 = create(:application)
        create(:application_rejected_event, application: application2)
        application3 = create(:application)
        application4 = create(:application)
        create(:application_interview_event, application: application4)

        expect(Application.ongoing).to eq([application3, application4])
      end
    end

    context '#with_active_job' do
      it 'returns applications with active jobs' do
        job1 = create(:job)
        create(:job_activated_event, job: job1)
        job2 = create(:job)
        create(:job_deactivated_event, job: job2)
        job3 = create(:job)
        application1 = create(:application, job: job1)
        application2 = create(:application, job: job2)
        application3 = create(:application, job: job3)

        expect(Application.with_active_job).to eq([application1])
      end
    end
  end

  describe '#last_interview_date' do
    it 'returns the interview date of the last Interview event' do
      application = create(:application)
      create(
        :application_interview_event,
        application: application,
        interview_date: '2024-01-01',
        created_at: 1.month.ago
      )
      create(
        :application_interview_event,
        application: application,
        interview_date: '2024-02-02',
        created_at: 2.weeks.ago
      )
      create(
        :application_interview_event,
        application: application,
        interview_date: '2024-03-03',
        created_at: 1.day.ago
      )

      expect(application.last_interview_date).to eq('2024-03-03')
    end

    it 'returns nil if there are no Interview events' do
      application = create(:application)

      expect(application.last_interview_date).to be_nil
    end
  end

  describe '#notes_count' do
    it 'returns the count of the Note events' do
      application = create(:application)
      create(:application_note_event, application: application)
      create(:application_note_event, application: application)
      create(:application_note_event, application: application)

      expect(application.notes_count).to eq(3)
    end
  end

  describe '#status' do
    it 'returns the status of the last event excluding Note' do
      application = create(:application)
      create(:application_interview_event, application: application)
      create(:application_note_event, application: application)
      create(:application_hired_event, application: application)
      create(:application_note_event, application: application)

      expect(application.status).to eq('hired')
    end

    it 'returns `applied` if there are no events' do
      application = create(:application)

      expect(application.status).to eq('applied')
    end
  end
end
