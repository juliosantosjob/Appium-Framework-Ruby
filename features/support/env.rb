require 'cucumber'
require 'rspec'
require 'rubocop'
require 'appium_lib'
require 'yaml'
require 'allure-cucumber'
require 'ruby-lsp'

DEFAULT_HOLD = 20

caps = Appium.load_appium_txt file: File.join(__dir__, 'caps', 'android_appium.txt')
Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

FileUtils.rm_f(Dir.glob('output/*'))
