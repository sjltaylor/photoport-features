require 'spec_helper'

feature 'editing' do
  background { cms.new_collection }
  scenario 'uploading a photo' do
    cms.upload_photo('./samples/bushes.jpg')
    Selenium::WebDriver::Wait.new(
      timeout: 10,
      message: 'photo was not displayed')
    .until do
      ui.photoport.current.photo?
    end
  end
  scenario 'removing a photo' do
    cms.upload_photo('./samples/bushes.jpg')
    cms.wait_for_photo_to_upload
    ui.photoport.current.should be_photo
    cms.open_edit
    cms.remove_current
    cms.wait_for_upload_panel_to_animate
    ui.cms.upload_panel.should be_visible
    ui.photoport.left_handle.click
    ui.cms.upload_panel.should be_visible
    ui.photoport.right_handle.click
    ui.cms.upload_panel.should be_visible

    reload

    ui.cms.upload_panel.should be_visible
    ui.photoport.right_handle.click
    ui.cms.upload_panel.should be_visible
    ui.photoport.left_handle.click
    ui.cms.upload_panel.should be_visible
  end
end