module Habits
  extend self
  extend Capybara::DSL
  extend UI

  def reload
    visit current_url
  end
end