SimpleCov.start 'rails' do
  minimum_coverage 95
  add_filter 'app/jobs/application_job.rb'
  add_filter 'app/mailers/application_mailer.rb'
end
