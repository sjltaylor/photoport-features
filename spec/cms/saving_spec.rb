require 'spec_helper'

feature 'saving' do
  background { cms.new_collection }
  scenario 'a stranger creates and saves a collection' do
    # the save button is not yet visible
    # cms.create_collection # reuse steps into a habit
    # click on save, the button is no visible
    # there should now be an email field to fill in
    # fill it in an click save
    # now it asks for a password, no confirmation a show tickbox which times out password visibility
    pending
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