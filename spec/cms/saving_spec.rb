require 'spec_helper'

feature 'saving' do
  background { cms.new_collection }

  scenario 'displaying the save prompt' do
    ui.cms.should_not have_save_prompt
    cms.upload_photo
    ui.cms.should have_save_prompt

    reload

    ui.cms.should have_save_prompt
  end

  scenario 'a stranger creates and saves a collection' do
    ui.cms.should_not have_save_prompt
    cms.upload_photo
    ui.cms.should have_save_prompt
    # accept the save prompt
    click_on 'Save'
    cms.save

    reload

    ui.cms.should_not have_save_prompt
    ui.photoport.photos.count.should be 1
  end

  scenario 'a stranger tries to save a collection and is prompted to sign in because they are already registered' do
    # sign up
    # sign out
    # create a colleciton
    # enter email address of the identity previously registered
    # fill in password
    # see you are now signed in and the new colleciton has been saved
    pending
  end
end
