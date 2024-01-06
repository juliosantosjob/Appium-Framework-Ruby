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

require_relative "./setup_tools"
require_relative "./custom_commands"

DEFAULT_HOLD = 20

Appium::Driver.new(desired_caps, true)
Appium.promote_appium_methods Object
