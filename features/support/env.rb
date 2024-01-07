require "cucumber"
require "rspec"
require "rubocop"
require "appium_lib"
require "allure-cucumber"
require "browserstack/local"
require "selenium-webdriver"
require "dotenv-vault/load"
require "sinatra"
require "erb"
require "yaml"
require "ruby-lsp"
require "rake"

require_relative "./setup_tools"
require_relative "./helpers/custom_commands"

Appium::Driver.new(desired_caps, true)
Appium.promote_appium_methods Object

Rake.application.run(["clean_output"])
DEFAULT_HOLD = 20
