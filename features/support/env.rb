require 'cucumber'
require 'rspec'
require 'rubocop'
require 'appium_lib'
require 'yaml'
require 'allure-cucumber'
require 'appium_lib_core'
require_relative './caps'
require_relative './helpers'

DEFAULT_HOLD = 20

FileUtils.rm_f(Dir.glob('output/*'))
Appium::Driver.new(get_caps, true)
Appium.promote_appium_methods Object
