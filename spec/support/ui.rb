require 'active_support/inflector'
require 'singleton'

module UI
  extend self

  class Helper
    include Singleton
    include Capybara::DSL
  end

  def ui
    Helper.instance
  end
end
