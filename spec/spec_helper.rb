require 'rubygems'
require 'spork'
require 'json'
require 'webmock/rspec'
include WebMock::API

#if ENV['COVERAGE']
  require 'simplecov'
  require 'simplecov-rcov'
  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  SimpleCov.start do
    add_filter "/spec/"
  end

  SimpleCov.start # 'rails'
#end

Spork.prefork do
  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  require 'rspec/rails'

  
  Dir[Rails.root.join('spec/support/**/*.rb')].each{|f| require f}
 
  if Spork.using_spork?
    ActiveSupport::Dependencies.clear
  end
  
  RSpec.configure do |config|
    config.mock_with :rspec
    #config.fixture_path = "#{Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = true
    #config.include Devise::TestHelpers, :type => :controller
    #config.extend LoginMacros, :type => :controller
  end
  
  require 'rspec/autorun'
  require 'shoulda/matchers/integrations/rspec'
  require "rails/application"
  require 'rspec/mocks'
  require 'rspec/expectations'
  require 'rspec/matchers'
end
 
Spork.each_run do
  load "#{Rails.root}/config/routes.rb"
  silence_warnings do
    Dir["#{Rails.root}/app/**/*.rb"].each {|f| load f}
  end

  require 'factory_girl'
  FactoryGirl.reload
end
