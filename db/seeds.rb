# frozen_string_literal: true

# jobs
qa_job = FactoryBot.create(:job, title: 'QA Engineer', description: 'Test software applications')
backend_job = FactoryBot.create(:job, title: 'Backend Engineer', description: 'Develop software applications')
frontend_job = FactoryBot.create(:job, title: 'Frontend Engineer', description: 'Develop software applications')
devops_job = FactoryBot.create(:job, title: 'DevOps Engineer', description: 'Configure software applications')

# applications
qa_application1 = FactoryBot.create(:application, job: qa_job, candidate_name: 'Liam')

backend_application1 = FactoryBot.create(:application, job: backend_job, candidate_name: 'John')
backend_application2 = FactoryBot.create(:application, job: backend_job, candidate_name: 'Jane')
backend_application3 = FactoryBot.create(:application, job: backend_job, candidate_name: 'George')

frontend_application1 = FactoryBot.create(:application, job: frontend_job, candidate_name: 'Alice')
frontend_application2 = FactoryBot.create(:application, job: frontend_job, candidate_name: 'Bob')

devops_application1 = FactoryBot.create(:application, job: devops_job, candidate_name: 'Charlie')

# job events
_qa_job_event1 = FactoryBot.create(:job_deactivated_event, job: qa_job)
_qa_job_event2 = FactoryBot.create(:job_activated_event, job: qa_job)
_qa_job_event3 = FactoryBot.create(:job_deactivated_event, job: qa_job)
_backend_job_event = FactoryBot.create(:job_activated_event, job: backend_job)
_frontend_job_event = FactoryBot.create(:job_activated_event, job: frontend_job)
_devops_job_event1 = FactoryBot.create(:job_activated_event, job: devops_job)
_devops_job_event2 = FactoryBot.create(:job_deactivated_event, job: devops_job)

# application events, John
_backend_application1_event1 = FactoryBot.create(:application_interview_event, application: backend_application1, interview_date: 1.week.ago)
_backend_application1_event2 = FactoryBot.create(:application_note_event, application: backend_application1, content: 'John is a good candidate')
_backend_application1_event3 = FactoryBot.create(:application_hired_event, application: backend_application1, hire_date: 1.day.ago)

# application events, Jane
_backend_application2_event1 = FactoryBot.create(:application_interview_event, application: backend_application2, interview_date: 2.days.ago)
_backend_application2_event2 = FactoryBot.create(:application_note_event, application: backend_application2, content: 'Jane is not a good candidate')
_backend_application2_event3 = FactoryBot.create(:application_rejected_event, application: backend_application2)

# application events, George
_backend_application3_event1 = FactoryBot.create(:application_interview_event, application: backend_application3, interview_date: 2.week.ago)
_backend_application3_event2 = FactoryBot.create(:application_note_event, application: backend_application3, content: 'George is a good candidate')
_backend_application3_event3 = FactoryBot.create(:application_note_event, application: backend_application3, content: 'Need more time to think')
_backend_application3_event4 = FactoryBot.create(:application_note_event, application: backend_application3, content: 'Need even more time to think')

# application events, Alice
_frontend_application1_event1 = FactoryBot.create(:application_interview_event, application: frontend_application1, interview_date: 1.day.from_now)

# application events, Charlie
_devops_application1_event1 = FactoryBot.create(:application_note_event, application: devops_application1, content: 'Will schedule an interview soon')
