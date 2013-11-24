module UI
  module Photoport
    module Current
      def photo?
        background_image_style_regexp = /background-image: url\(http:\/\/.*\/collections\/\d+\/photos\/\d+.jpg\);/
        !!background_image_style_regexp.match(self['style'])
      end
    end

    def current
      first('.content div').extend(Current)
    end

    def right_handle
      find('.photoport-handle-right')
    end

    def left_handle
      find('.photoport-handle-left')
    end
  end
end