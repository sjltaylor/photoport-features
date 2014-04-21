module UI
  module Photoport
    def right_handle
      find('.photoport-handle-right')
    end

    def left_handle
      find('.photoport-handle-left')
    end

    def photos
      all('.photoport-photo', visible: :all)
    end
  end

  def ui.photoport
    find(:css, '.photoport').extend(Photoport)
  end
end
