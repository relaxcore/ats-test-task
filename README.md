## ATS with Event Sourcing

### How to set up a project
1. Clone the repo
```
git clone git@github.com:relaxcore/ats-test-task.git
```
2. Create and setup the database
```
rails db:create
rails db:migrate
rails db:seed
```
3. Install the Ruby 3.3.1 or switch to it if it's already installed
4. Install all the dependencies
```
bundle install
```
5. Run the rspec tests to double-check everything is ok
```
bundle exec rspec
```
6. Boot up a server
```
rails s
```

### Endpoints
* GET `/applications`
* GET `/jobs`

### Applications response example
```
[
    {
        "id": "8e0de2d5-6746-4ae7-b67d-dcf076679e84",
        "candidate_name": "Alice",
        "status": "interview",
        "job_name": "Frontend Engineer",
        "notes_count": 0,
        "last_interview_date": "2024-05-23T12:49:56.255Z"
    },
    {
        "id": "e11ae520-4ec3-418b-80c0-9d352b889e6f",
        "candidate_name": "Bob",
        "status": "applied",
        "job_name": "Frontend Engineer",
        "notes_count": 0,
        "last_interview_date": null
    },
    {
        "id": "2d7f1447-1e85-428a-b379-fdf2ea32ec68",
        "candidate_name": "John",
        "status": "hired",
        "job_name": "Backend Engineer",
        "notes_count": 1,
        "last_interview_date": "2024-05-15T12:49:56.218Z"
    },
    {
        "id": "2084476d-ebc1-49b0-af2f-97b098dd5f9a",
        "candidate_name": "Jane",
        "status": "rejected",
        "job_name": "Backend Engineer",
        "notes_count": 1,
        "last_interview_date": "2024-05-20T12:49:56.241Z"
    },
    {
        "id": "d4906449-f1c6-42b8-bbd1-7e23d414fd1f",
        "candidate_name": "George",
        "status": "interview",
        "job_name": "Backend Engineer",
        "notes_count": 3,
        "last_interview_date": "2024-05-08T12:49:56.249Z"
    }
]
```

### Jobs response example
```
[
    {
        "id": "3e14429c-a4c1-4465-b4ba-bdf0d41f84b6",
        "title": "QA Engineer",
        "description": "Test software applications",
        "status": "deactivated",
        "hired_candidates_count": 0,
        "rejected_candidates_count": 0,
        "ongoing_candidates_count": 1
    },
    {
        "id": "2a219a72-8c54-45ec-a601-df899ad2a4ff",
        "title": "Backend Engineer",
        "description": "Develop software applications",
        "status": "activated",
        "hired_candidates_count": 1,
        "rejected_candidates_count": 1,
        "ongoing_candidates_count": 1
    },
    {
        "id": "225b5631-7147-45b1-8d4d-d7bf53fbeb9e",
        "title": "Frontend Engineer",
        "description": "Develop software applications",
        "status": "activated",
        "hired_candidates_count": 0,
        "rejected_candidates_count": 0,
        "ongoing_candidates_count": 2
    },
    {
        "id": "0932ad1b-75ea-426d-9428-46c3ac29814c",
        "title": "DevOps Engineer",
        "description": "Configure software applications",
        "status": "deactivated",
        "hired_candidates_count": 0,
        "rejected_candidates_count": 0,
        "ongoing_candidates_count": 1
    }
]
```