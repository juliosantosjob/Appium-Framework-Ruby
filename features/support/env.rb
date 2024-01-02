require 'cucumber'
require 'rspec'
require 'rubocop'
require 'appium_lib'
require 'yaml'
require 'allure-cucumber'

DEFAULT_HOLD = 20

FileUtils.rm_f(Dir.glob('output/*.json'))
FileUtils.rm_f(Dir.glob('output/*.png'))

Allure.configure do |config|
  config.results_directory = 'output/allure-results'
  config.clean_results_directory = true
end
