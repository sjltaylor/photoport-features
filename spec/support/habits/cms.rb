module Habits
  module Cms
    extend self
    extend Capybara::DSL
    extend UI

    def new_collection
      visit PHOTOPORT_CMS_FEATURES_TARGET_ROOT
    end

    def upload_photo(filepath)
      upload_panel = ui.photoport.upload_panel
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
  end

  def cms
    Cms
  end
end