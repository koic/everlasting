# -*- frozen-string-literal: true -*-

require 'bundler/setup'
require 'rails/all'
require 'rspec/rails'
require 'everlasting'
require 'action_controller/railtie'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
