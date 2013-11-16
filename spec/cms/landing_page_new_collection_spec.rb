require 'spec_helper'

feature 'landing page new collection' do
  background { cms.new_collection }
  scenario 'landing on the new collection page' do
    ui.photoport.upload_panel.should be_visible
  end
  scenario 'uploading a photo' do
    cms.upload_photo('./samples/bushes.jpg')
    Selenium::WebDriver::Wait.new(
      timeout: 10,
      message: 'photo was not displayed')
    .until do
      ui.photoport.current.photo?
    end
  end
end