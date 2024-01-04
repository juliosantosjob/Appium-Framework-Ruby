require 'cucumber'
require 'rspec'
require 'rubocop'
require 'appium_lib'
require 'yaml'
require 'allure-cucumber'
require 'appium_lib_core'
require 'browserstack/local'
require 'selenium-webdriver'
require 'dotenv-vault/load'
require 'sinatra'
require 'erb'

require_relative './setup_tools'

DEFAULT_HOLD = 20

Appium::Driver.new(desired_caps, true)
Appium.promote_appium_methods Object
