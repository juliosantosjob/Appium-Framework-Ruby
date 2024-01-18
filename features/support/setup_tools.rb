require "dotenv-vault/load"
require "yaml"

@tools = ENV["tools"]

def desired_caps

  case @tools ||= "ap"
  when "ap"
    appium_caps = YAML.load_file("features/support/caps/android_appium.yml")
    { caps: appium_caps["caps"], appium_lib: appium_caps["appium_lib"] }

  when "bs"
    browserstack_caps = YAML.safe_load(
      ERB.new(File.read("features/support/caps/android_browserstack.yml")).result(binding)
    )
    { caps: browserstack_caps["caps"], appium_lib: browserstack_caps["appium_lib"] }

  else
    raise "Invalid argument for platform, please enter a valid argument!"
  end
end
