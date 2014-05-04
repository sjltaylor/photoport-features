module Habits
  module Cms
    extend self
    extend Capybara::DSL
    extend RSpec::Matchers
    extend UI

    def new_collection
      visit PHOTOPORT_CMS_FEATURES_TARGET
    end

    def upload_photo(source: './samples/bushes.jpg', wait_for_photo_to_upload: true)
      upload_panel = ui.cms.upload_panel
      upload_panel.show_file_input
      upload_panel.attach_file('file', File.expand_path(source))
      upload_panel.show_file_input(false)
      self.wait_for_photo_to_upload if wait_for_photo_to_upload
    end

    def wait_for_photo_to_upload
      Selenium::WebDriver::Wait.new(
        timeout: 10,
        message: 'photo was not displayed')
      .until do
        ui.photoport.current.photo?
      end
    end

    def wait_for_upload_panel_to_animate
      Selenium::WebDriver::Wait.new(
        timeout: 10,
        message: 'upload panel was not displayed')
      .until do
        ui.cms.upload_panel.visible?
      end
    end

    def open_edit
      ui.photoport.current.click_hold(500)
      Selenium::WebDriver::Wait.new(
        timeout: 1,
        message: 'edit panel was not displayed')
      .until do
        ui.cms.edit_panel && ui.cms.edit_panel.visible?
      end
    end

    def remove_current
      ui.cms.edit_panel.remove.click
      Selenium::WebDriver::Wait.new(
        timeout: 5,
        message: 'photo was not removed, or edit panel was left open')
      .until do
        !ui.cms.edit_panel || (ui.cms.edit_panel && !ui.cms.edit_panel.visible?)
      end
    end

    def identify(email_address: 'email@address.net', password: 'password')
      ui.should have_css('.identify-view')
      fill_in 'email', with: email_address
      fill_in 'password', with: password
      ui.find('.js-identify').click
    end
  end

  def cms
    Cms
  end
end
