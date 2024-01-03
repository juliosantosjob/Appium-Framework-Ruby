require 'cucumber'
require 'rspec'
require 'rubocop'
require 'appium_lib'
require 'yaml'
require 'allure-cucumber'
require 'appium_lib_core'
require_relative './caps'

DEFAULT_HOLD = 20

Appium::Driver.new(get_caps, true)
Appium.promote_appium_methods Object
