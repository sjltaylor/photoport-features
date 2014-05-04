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
    cms.identify

    reload

    ui.cms.should_not have_save_prompt
    ui.photoport.photos.count.should be 1
  end

  scenario 'a returing but unidentified user saves a collection with the wrong password' do
    click_on "Sign in"

    email_address = 'auser@domain.com'

    cms.identify(email_address: email_address, password: 'password')

    ui.should have_content "Sign out"

    click_on "Sign out"

    click_on "Sign in"

    cms.identify(email_address: email_address, password: 'WRONGPASSWORD')

    ui.should have_content "Wrong password"

    ui.should have_content "Sign in"

    cms.identify(email_address: email_address, password: 'password')

    pending "collection should be in the list"
  end
end
