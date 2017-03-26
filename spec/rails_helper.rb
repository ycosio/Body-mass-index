# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'capybara/rails'
require 'capybara/rspec'
require 'spec_helper'
require 'rspec/rails'
require 'shoulda-matchers'
require 'factory_girl_rails'
require 'support/factory_girl'
require 'helpers/session'
require 'devise'

ActiveRecord::Migration.maintain_test_schema!

Shoulda::Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
      end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include Session

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include Devise::Test::ControllerHelpers, :type => :controller

  config.include Capybara::DSL
end
