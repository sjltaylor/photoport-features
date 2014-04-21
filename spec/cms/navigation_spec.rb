require 'spec_helper'

feature 'navigation' do
  background { cms.new_collection }
  scenario 'navigating' do
    cms.upload_photo

    ui.photoport.right_handle.click
    cms.upload_photo(source: './samples/molehills.jpg')

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
end
