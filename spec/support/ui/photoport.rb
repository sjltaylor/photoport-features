module UI
  module Photoport
    module UploadPanel
      include Capybara::DSL
      def show_file_input(visible=true)
        display = visible ? 'inline' : 'none'
        page.execute_script <<-JS
          var file_input = document.querySelector('.photoport-cms-upload-panel form input[type="file"]');
          file_input.style.display = "#{display}";
        JS
      end
    end
    def upload_panel
      find(:css, '.photoport-cms-upload-panel').extend(UploadPanel)
    end

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

  def ui.photoport
    find(:css, '.photoport').extend(Photoport)
  end
end