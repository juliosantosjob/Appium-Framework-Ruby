require "cucumber"
require "rspec"
require "rubocop"
require "appium_lib"
require "allure-cucumber"
require "browserstack/local"
require "selenium-webdriver"
require "ruby-lsp"
require "rake"

require_relative "./setup_tools"
require_relative "./custom_commands"

Rake.application.run(["clean_output"])

Appium::Driver.new(desired_caps, true)
Appium.promote_appium_methods Object

DEFAULT_HOLD = 20
