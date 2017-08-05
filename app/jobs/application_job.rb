class ApplicationJob < ActiveJob::Base
end

# ApplicationJob is a framework for declaring jobs and making them run on a variety of queuing backends
# ie regularly scheduled clean-ups, billing charges, mailings
# anything that can be shopped into small units of work and run in parallel

# ensure that all Rails app will have a job infrastructure in place
# do not have to worry about API differences between various job runners such as Delayed Job and Resque
# can switch between without having to rewrite jobs

# Rails generator
# create a job in app/jobs with attached test case under test/jobs
# bin/rails generate job guests_cleanup
# invoke test_unit
# create test/jobs/guests_cleanup_job_test.rb
# create app/jobs/guests_cleanup_job.rb

