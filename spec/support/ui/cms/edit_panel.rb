module UI
  module Cms
    module EditPanel
      def remove
        find('.btn.js-remove')
      end
    end

    def edit_panel
      first('.photoport-cms-edit-panel-container').extend(EditPanel)
    end
  end
end