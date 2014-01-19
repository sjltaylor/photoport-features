module UI
  module Cms
  end
  def ui.cms
    find('#main').extend(Cms)
  end
end