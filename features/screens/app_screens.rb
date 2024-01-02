class App_Screens

  def open_app
    find_element(:xpath, '//*[contains(@text,"NuConta")]').displayed?
  end

  def select_show_balance
    find_element(:accessibility_id, 'show-balance').click
  end

  def value_user_balance
    return find_element(:accessibility_id, 'user-balance').text
  end
end
