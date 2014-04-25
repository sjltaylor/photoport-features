require 'spec_helper'

feature 'identify' do
  background { cms.new_collection }

  scenario 'signing in and out' do
    click_on "Sign in"
    email_address = 'auser@domain.com'
    cms.identify(email_address: email_address, password: 'password')

    ui.should have_content "Sign out"
    ui.should have_content 'auser@domain.com'

    reload

    ui.should have_content "Sign out"
    ui.should have_content 'auser@domain.com'

    click_on "Sign out"

    ui.should have_content "Sign in"

    reload

    ui.should have_content "Sign in"
  end
end
