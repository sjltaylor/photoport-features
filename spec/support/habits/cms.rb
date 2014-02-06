module Habits
  module Cms
    extend self
    extend Capybara::DSL
    extend UI

    def new_collection
      visit PHOTOPORT_CMS_FEATURES_TARGET_ROOT
    end

    def upload_photo(filepath)
      upload_panel = ui.cms.upload_panel
      upload_panel.show_file_input
      upload_panel.attach_file('file', File.expand_path(filepath))
      upload_panel.show_file_input(false)
    end

    def wait_for_photo_to_upload
      Selenium::WebDriver::Wait.new(
        timeout: 10,
        message: 'photo was not displayed')
      .until do
        ui.photoport.current.photo?
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
      sleep 0.3 # give the ui time to respond
    end
  end

  def cms
    Cms
  end
end