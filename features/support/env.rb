require 'cucumber'
require 'rspec'
require 'rubocop'
require 'appium_lib'
require 'yaml'
require 'allure-cucumber'
require 'appium_lib_core'

DEFAULT_HOLD = 20

FileUtils.rm_f(Dir.glob('output/*'))

caps = Appium.load_appium_txt file: File.join(__dir__, 'caps', 'android_appium.txt')
@driver = Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
