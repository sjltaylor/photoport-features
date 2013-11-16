module Habits
  module Cms
    extend self
    extend Capybara::DSL

    def new_collection
      visit PHOTOPORT_CMS_FEATURES_TARGET_ROOT
    end
  end

  def cms
    Cms
  end
end