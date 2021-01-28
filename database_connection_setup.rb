require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  p 'test1'
  DatabaseConnection.setup('bookmark_manager_test')
else
  p 'test2'
  p ENV['ENVIRONMENT']
  DatabaseConnection.setup('bookmark_manager')
end