def open_keyboard
  driver.action.send_keys(:enter).perform
end

def close_keyboard
  driver.action.send_keys(:return).perform
end

def window_size
  driver.window_size
end

def swiping(x_s, y_s, x_o, y_o, time: 2000)
  swipe(
    start_x: x_s, start_y: y_s,
    offset_x: x_o, offset_y: y_o,
    duration: time
  )

  # to = 0
  # screen_size = driver.window_size
  # screen_width = screen_size.width

  # element = find_element(:xpath, locator)
  # position_x = element["x"].to_i + element["width"].to_i / 2
  # position_y = element["y"].to_i + element["height"].to_i / 2

  # to = (screen_width * 6) / 100

  # swipe({ x: position_x, y: position_y, x: to, y: position_y })
end
