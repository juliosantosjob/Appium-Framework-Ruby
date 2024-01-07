# Open the in-app keyboard
def open_keyboard
  driver.is_keyboard_shown
end

# Close the in-app keyboard
def close_keyboard
  driver.hide_keyboard
end

# Get the screen dimensions.
def screen_size
  driver.window_size
end

# Reinstall the application.
def reinstall_app
  driver.reset
end

# Method for wait and click on a mobile element.
#
# @param attributes - Hash with the attributes to locate the element.
# @param timeout [Integer] (optional) wait click seconds. Default: 5.
#
# Example: wait_and_tap({ id: 'button_send' })

def wait_and_tap(attributes, timeout = 5)
  begin
    manage.timeouts.implicit_wait = timeout
    find_element(attributes).click
  rescue => e
    raise "Error: Unable to wait and click on element #{e.message}"
  end
end

# Method for performing a swipe movement between two elements
#
# @param firts_element [Element] The first element from which to start the swipe.
# @param second_element [Element] The second element to swipe to.
# @param timeout [Integer] (optional) Swipe duration time in milliseconds. Default: 2500.
#
# firts_element = find_element(:xpath, @f_element)
# second_element = find_element(:xpath, @s_element)
#
# Example: swiping(firts_element, second_element, 2000)

def swiping(firts_element, second_element, timeout: 2500)
  begin
    position_x = firts_element.location.x + firts_element.size.width / 2
    position_z = firts_element.location.y + firts_element.size.height / 2

    position_x_ = second_element.location.x + second_element.size.width / 2
    position_z_ = second_element.location.y + second_element.size.height / 2

    swipe(
      start_x: position_x, start_y: position_z,
      offset_x: position_x_, offset_y: position_z_,
      duration: timeout
    )
  rescue => e
    raise "Error: Unable to swipe #{e.message}"
  end
end
