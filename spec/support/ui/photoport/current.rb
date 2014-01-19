module UI
  module Photoport
    module Current
      def photo?
        background_image_style_regexp = /background-image: url\(http:\/\/.*\/collections\/\d+\/photos\/\d+.jpg\);/
        !!background_image_style_regexp.match(self['style'])
      end
      def click_hold(duration_in_milliseconds)
        js = <<-JS
          var e = document.querySelector('.photoport-element.current');
          if (!e) throw "Can't find current photoport element";
          var mousedown = new MouseEvent('mousedown');
          var mouseup   = new MouseEvent('mouseup');
          e.dispatchEvent(mousedown);
          setTimeout(function () {
            e.dispatchEvent(mouseup);
          }, #{duration_in_milliseconds});
        JS
        driver.execute_script(js)
      end
    end

    def current
      find('.photoport-element.current').extend(Current)
    end

    def right_handle
      find('.photoport-handle-right')
    end

    def left_handle
      find('.photoport-handle-left')
    end
  end
end