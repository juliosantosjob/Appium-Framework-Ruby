require_relative './helpers'

$tools = ENV['t']

def get_caps
  $tools='ap' if $tools.nil?

  case $tools
  when 'ap'
    appium_caps = load_file('caps', 'android_appium.yml')
    caps = {
      caps: appium_caps['caps'],
      appium_lib: appium_caps['appium_lib']
    }
  when 'bs'
    browserstack_caps = load_file('caps', 'android_broserstack.yml')
    caps = {
      caps: browserstack_caps['caps_bs'],
      appium_lib: browserstack_caps['browser_caps']
    }
  else
    raise 'Invalid argument for platform, please enter a valid argument!'
  end
  return caps
end
