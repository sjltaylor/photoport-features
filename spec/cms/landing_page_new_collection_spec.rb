require 'spec_helper'

feature 'landing page new collection' do
  background { cms.new_collection }
  scenario 'landing on the new collection page' do
    ui.cms.upload_panel.should be_visible
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
  scenario 'uploading photos and navigating' do
    cms.upload_photo('./samples/bushes.jpg')
    cms.wait_for_photo_to_upload

    ui.photoport.right_handle.click
    cms.upload_photo('./samples/molehills.jpg')
    cms.wait_for_photo_to_upload

    ui.photoport.current.should be_photo

    ui.photoport.right_handle.click
    ui.cms.upload_panel.should be_visible

    ui.photoport.right_handle.click
    ui.cms.upload_panel.should be_visible

    ui.photoport.left_handle.click
    ui.photoport.current.should be_photo

    ui.photoport.left_handle.click
    ui.photoport.current.should be_photo

    previous_current = ui.photoport.current

    ui.photoport.left_handle.click
    ui.photoport.current.should be_photo

    ui.photoport.current.should eq previous_current

    reload
    ui.photoport.current.should be_photo

    ui.photoport.left_handle.click
    ui.photoport.current.should be_photo

    2.times { ui.photoport.right_handle.click }
    ui.cms.upload_panel.should be_visible
  end
  scenario 'removing photos' do
    cms.upload_photo('./samples/bushes.jpg')
    cms.wait_for_photo_to_upload
    ui.photoport.current.should be_photo
    cms.open_edit
    cms.remove_current
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