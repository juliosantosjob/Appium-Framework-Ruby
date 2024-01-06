require_relative "./load_files"

@tools = ENV["t"]

def desired_caps
  @tools ||= "ap"

  case @tools
  when "ap"
    appium_caps = load_file("caps", "android_appium.yml")
    { caps: appium_caps["caps"], appium_lib: appium_caps["appium_lib"] }

  when "bs"
    browserstack_caps = read_file("caps", "android_browserstack.yml")
    { caps: browserstack_caps["caps"], appium_lib: browserstack_caps["appium_lib"] }

  else
    raise "Invalid argument for platform, please enter a valid argument!"
  end
end
