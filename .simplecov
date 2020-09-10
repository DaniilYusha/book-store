SimpleCov.start 'rails' do
  minimum_coverage 95
  add_filter [
    '/app/channels',
    '/app/jobs',
    '/app/mailers',
    '/app/models/application_record.rb'
  ]
end
