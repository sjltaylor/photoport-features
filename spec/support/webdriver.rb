Capybara.register_driver :safari do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

Capybara.register_driver :chrome do |app|
  driver = Capybara::Selenium::Driver.new(app, browser: :chrome)
  window = driver.browser.manage.window
  window.move_to 0, 0
  window.maximize
  driver
end

Capybara.default_driver = :chrome
