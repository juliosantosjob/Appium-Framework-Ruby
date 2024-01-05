class AppScreens
  def open_app
    find_element(:xpath, "//*[contains(@text,'NuConta')]").displayed?
  end

  def select_show_balance
    find_element(:accessibility_id, "show-balance").click
  end

  def user_balance
    find_element(:accessibility_id, "user-balance").text
  end

  def select_transfer
    swiping(930, 1900, 200, 200)
    find_element(:xpath, "//*[contains(@text,'Transferir')]").click
  end

  def fill_contact
    find_element(:xpath, "//*[contains(@text,'Buscar Contato')]").click
    find_element(:xpath, "//*[contains(@text,'Buscar Contato')]").send_keys("Reed Richards")
  end

  def contact_view
    find_element(:xpath, "//*[contains(@text,'Reed Richards')]").displayed?
  end
end
