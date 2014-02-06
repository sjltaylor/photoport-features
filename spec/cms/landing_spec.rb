require 'spec_helper'

feature 'landing' do
  background { cms.new_collection }
  scenario 'landing on the new collection page' do
    ui.cms.upload_panel.should be_visible
  end
end