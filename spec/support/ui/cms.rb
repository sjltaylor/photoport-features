module UI
  module Cms
    def has_save_prompt?
      has_css?('.save-prompt')
    end

  end
  def ui.cms
    find('#main').extend(Cms)
  end
end
